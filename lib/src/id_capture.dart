/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/base_controller.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/generated/id_method_handler.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/generated/schema_types.dart'
    show IdCaptureListenerDidCaptureId, IdCaptureListenerDidRejectId, ImageInfo;

import 'package:scandit_flutter_datacapture_id/src/rejection_reson.dart';

import '../scandit_flutter_datacapture_id.dart';
import 'internal/function_names.dart';
import 'internal/id_capture_defaults.dart';
import 'tolerant_payload_parser.dart';

/// Listener interface for id capture.
///
/// Added in version 6.11.0
abstract class IdCaptureListener {
  static const String _didCaptureId = "IdCaptureListener.didCaptureId";
  static const String _didRejectId = "IdCaptureListener.didRejectId";

  /// Called whenever a document is recognized and parsed.
  ///
  /// Set [IdCapture.isEnabled] to *false* at the start of this callback to prevent additional captures while the result is being handled, and restore it to *true* when processing is complete. This method is called on a background thread — dispatch any UI work to the main thread.
  ///
  /// Added in version 7.0.0
  Future<void> didCaptureId(IdCapture idCapture, CapturedId capturedId);

  /// Called whenever a personal identification document or its part is recognized in a frame, but rejected. A document is rejected if (a) it’s not enabled in the settings, (b) it’s a barcode of a correct symbology or a Machine Readable Zone (MRZ), but the data is encoded in an unexpected/incorrect format, (c) it meets the requirement of a rejection rule defined in the settings (for instance, voided ID rejection or expired ID rejection).
  ///
  /// This method is called on a background thread — dispatch any UI work to the main thread.
  ///
  /// Added in version 7.0.0
  Future<void> didRejectId(IdCapture idCapture, CapturedId? rejectedId, RejectionReason reason);
}

/// Added in version 6.11.0
class IdCapture extends DataCaptureMode {
  late _IdCaptureListenerController _controller;

  bool _enabled = true;

  final List<IdCaptureListener> _listeners = [];

  IdCaptureSettings _settings;

  IdCaptureFeedback _feedback = IdCaptureFeedback.defaultFeedback;

  final _modeId = Random().nextInt(0x7FFFFFFF);

  IdCapture._(DataCaptureContext? context, this._settings) {
    _controller = _IdCaptureListenerController(this);

    context?.setMode(this);
    _feedback.addListener(_onFeedbackChanged);
  }

  /// Constructs a new [IdCapture] with the provided settings.
  ///
  /// Added in version 7.6.0
  IdCapture(IdCaptureSettings settings) : this._(null, settings);

  void _onFeedbackChanged() {
    _controller.updateFeedback(_feedback);
  }

  /// Creates the recommended camera settings to use with this mode.
  ///
  /// Added in version 7.6.0
  static CameraSettings createRecommendedCameraSettings() {
    var defaults = IdCaptureDefaults.cameraSettingsDefaults;
    return CameraSettings(
      defaults.preferredResolution,
      defaults.zoomFactor,
      defaults.focusRange,
      defaults.focusGestureStrategy,
      defaults.zoomGestureZoomFactor,
      properties: defaults.properties,
      shouldPreferSmoothAutoFocus: defaults.shouldPreferSmoothAutoFocus,
      torchLevel: defaults.torchLevel,
      macroMode: defaults.macroMode,
      adaptiveExposure: defaults.adaptiveExposure,
    );
  }

  /// Implemented from [DataCaptureMode]. See [DataCaptureMode.context].
  ///
  /// Added in version 6.11.0
  @override
  // ignore: unnecessary_overrides
  DataCaptureContext? get context => super.context;

  /// Implemented from [DataCaptureMode]. See [DataCaptureMode.isEnabled].
  ///
  /// Added in version 6.11.0
  @override
  bool get isEnabled => _enabled;

  /// Implemented from [DataCaptureMode]. See [DataCaptureMode.isEnabled].
  ///
  /// Added in version 6.11.0
  @override
  set isEnabled(bool newValue) {
    _enabled = newValue;
    _controller.setModeEnabledState(newValue);
  }

  /// Instance of [IdCaptureFeedback], determines what feedback (vibration, sound) should be emitted during the ID Capture process.
  ///
  /// Added in version 6.22.0
  IdCaptureFeedback get feedback => _feedback;

  /// Instance of [IdCaptureFeedback], determines what feedback (vibration, sound) should be emitted during the ID Capture process.
  ///
  /// Added in version 6.22.0
  set feedback(IdCaptureFeedback newValue) {
    _feedback.removeListener(_onFeedbackChanged);
    _feedback = newValue;
    _controller.updateFeedback(newValue);
    _feedback.addListener(_onFeedbackChanged);
  }

  /// Adds the listener to this id capture instance.
  ///
  /// In case the same listener is already observing this instance, calling this method will not add the listener again.
  ///
  /// Added in version 6.11.0
  void addListener(IdCaptureListener listener) {
    if (_listeners.isEmpty) {
      _controller.subscribeListeners();
    }
    if (_listeners.contains(listener)) {
      return;
    }
    _listeners.add(listener);
  }

  /// Removes listener from this id capture instance.
  ///
  /// In case the listener is not currently observing this instance, calling this method has no effect.
  ///
  /// Added in version 6.11.0
  void removeListener(IdCaptureListener listener) {
    _listeners.remove(listener);
    if (_listeners.isEmpty) {
      _controller.unsubscribeListeners();
    }
  }

  String? _externalTransactionId;

  /// Sets or retrieves an external transaction ID. This ID is attached to ID scan analytics data, to be linkable to customer transactions. Set to *null* to clear the transaction ID.
  ///
  /// Added in version 8.0.0
  String? get externalTransactionId => _externalTransactionId;

  /// Sets or retrieves an external transaction ID. This ID is attached to ID scan analytics data, to be linkable to customer transactions. Set to *null* to clear the transaction ID.
  ///
  /// Added in version 8.0.0
  set externalTransactionId(String? value) {
    _externalTransactionId = value;
    _controller.updateIdCaptureMode();
  }

  /// Resets the ongoing scanning process. This method can be used to abandon scanning the back side of a document.
  ///
  /// Added in version 6.11.0
  Future<void> reset() {
    return _controller.reset();
  }

  /// Asynchronously applies the new settings to the ID Capture. If the scanner is currently running, the task will complete when the next frame is processed, and will use the new settings for that frame. If the scanner is currently *not* running, the task will complete as soon as the settings have been stored and won’t wait until the next frame is going to be processed.
  ///
  /// Added in version 6.19.0
  Future<void> applySettings(IdCaptureSettings settings) {
    _settings = settings;
    return _controller.applyNewSettings(settings);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': 'idCapture',
      "settings": _settings.toMap(),
      'feedback': _feedback.toMap(),
      'externalTransactionId': _externalTransactionId,
      'modeId': _modeId,
      'enabled': _enabled,
    };
  }
}

class _IdCaptureListenerController extends BaseController {
  final EventChannel _eventChannel = const EventChannel(IdCaptureFunctionNames.eventsChannelName);
  final IdCapture _idCapture;
  StreamSubscription<dynamic>? _idCaptureSubscription;
  late final IdMethodHandler idMethodHandler;

  _IdCaptureListenerController(this._idCapture) : super(IdCaptureFunctionNames.methodsChannelName) {
    idMethodHandler = IdMethodHandler(methodChannel);
  }

  @override
  void dispose() {
    unsubscribeListeners();
    super.dispose();
  }

  void subscribeListeners() {
    idMethodHandler
        .addIdCaptureListener(modeId: _idCapture._modeId)
        .then((value) => _setupIdCaptureSubscription(), onError: onError);
  }

  Future<void> reset() {
    return idMethodHandler.resetIdCaptureMode(modeId: _idCapture._modeId).onError(onError);
  }

  void _setupIdCaptureSubscription() {
    _idCaptureSubscription = _eventChannel.receiveBroadcastStream().forMode(_idCapture._modeId).listen((event) async {
      // A different event on this stream owes no ack, so this is the only check that may sit
      // outside the try.
      if (event.isEvent(IdCaptureListener._didCaptureId)) {
        await _handleDidCaptureId(event);
      } else if (event.isEvent(IdCaptureListener._didRejectId)) {
        await _handleDidRejectId(event);
      }
    });
  }

  // ACK-owing (2s bounded timeout, both platforms): native blocks on finishDidCaptureCallback,
  // so a throwing (or schema-rejected) payload must still ack. Work in `try`, ack in `finally`.
  Future<void> _handleDidCaptureId(FlutterEvent event) async {
    try {
      if (_idCapture._listeners.isEmpty) return;
      final payload = parsePayloadTolerantly<IdCaptureListenerDidCaptureId>(
        event.payload,
        (raw) => IdCaptureListenerDidCaptureId.fromJson(raw),
        (raw) {
          final map = raw is Map ? raw : const <String, dynamic>{};
          // `id` is required and cannot be reconstructed from a missing/invalid value
          // (an empty placeholder would report a bogus document), so decline.
          if (map['id'] is! String) return null;
          return IdCaptureListenerDidCaptureId(
            id: map['id'] as String,
            imageInfo: _tolerantImageInfo(map['imageInfo']),
            frontReviewImage: map['frontReviewImage'] is String ? map['frontReviewImage'] as String : null,
            modeId: map['modeId'] is int ? map['modeId'] as int : _idCapture._modeId,
            event: IdCaptureListener._didCaptureId,
          );
        },
        'didCaptureId',
        'IdCaptureListenerController',
      );
      if (payload == null) return;
      var capturedId = _parseCapturedId(payload.id, payload.imageInfo, payload.frontReviewImage);
      await _notifyDidCaptureId(capturedId);
    } catch (error) {
      developer.log('IdCaptureListenerController didCaptureId failed: $error');
    } finally {
      await idMethodHandler
          .finishDidCaptureCallback(modeId: _idCapture._modeId, enabled: _idCapture.isEnabled)
          .onError(onError);
    }
  }

  // ACK-owing, same contract as _handleDidCaptureId: native blocks on finishDidRejectCallback.
  Future<void> _handleDidRejectId(FlutterEvent event) async {
    try {
      if (_idCapture._listeners.isEmpty) return;
      final payload = parsePayloadTolerantly<IdCaptureListenerDidRejectId>(
        event.payload,
        (raw) => IdCaptureListenerDidRejectId.fromJson(raw),
        (raw) {
          final map = raw is Map ? raw : const <String, dynamic>{};
          // `rejectionReason` is required and cannot be guessed from a missing/invalid
          // value, so decline.
          if (map['rejectionReason'] is! String) return null;
          return IdCaptureListenerDidRejectId(
            rejectionReason: map['rejectionReason'] as String,
            id: map['id'] is String ? map['id'] as String : null,
            imageInfo: _tolerantImageInfo(map['imageInfo']),
            frontReviewImage: map['frontReviewImage'] is String ? map['frontReviewImage'] as String : null,
            modeId: map['modeId'] is int ? map['modeId'] as int : _idCapture._modeId,
            event: IdCaptureListener._didRejectId,
          );
        },
        'didRejectId',
        'IdCaptureListenerController',
      );
      if (payload == null) return;
      CapturedId? capturedId =
          payload.id != null ? _parseCapturedId(payload.id!, payload.imageInfo, payload.frontReviewImage) : null;
      // Decline explicitly rather than letting fromJSON's StateError fall into the catch below:
      // a Dart enum cannot carry a schema value it does not declare.
      final rejectionReason = RejectionReasonDeserializer.tryFromJSON(payload.rejectionReason);
      if (rejectionReason == null) {
        developer.log(
          'IdCaptureListenerController didRejectId: declining unrepresentable rejectionReason '
          "'${payload.rejectionReason}'",
        );
        return;
      }
      await _notifyDidRejectId(capturedId, rejectionReason);
    } catch (error) {
      developer.log('IdCaptureListenerController didRejectId failed: $error');
    } finally {
      await idMethodHandler
          .finishDidRejectCallback(modeId: _idCapture._modeId, enabled: _idCapture.isEnabled)
          .onError(onError);
    }
  }

  void unsubscribeListeners() {
    _idCaptureSubscription?.cancel();
    idMethodHandler.removeIdCaptureListener(modeId: _idCapture._modeId).onError(onError);
  }

  // Best-effort reconstruction for the tolerant fallback: a malformed `imageInfo` sub-object
  // must not sink the whole payload, since `id`/`rejectionReason` are what the ack is gated on.
  ImageInfo? _tolerantImageInfo(Object? raw) {
    if (raw is! Map) return null;
    try {
      return ImageInfo.fromJson(raw);
    } catch (error) {
      logPayloadIssueOnce('IdCaptureListenerController', 'imageInfo', 'imageInfo payload declined: $error');
      return null;
    }
  }

  CapturedId _parseCapturedId(String id, ImageInfo? imageInfo, String? frontReviewImage) {
    final decodedId = jsonDecode(id);

    if (imageInfo != null) {
      // IdImages.fromJSON reads nested keys off the maps, so an omitted key and an explicit
      // null are equivalent to it; the generated toJson() omits nulls.
      decodedId["imageInfo"] = {
        "front": imageInfo.front?.toJson() ?? const <String, Object?>{},
        "back": imageInfo.back?.toJson() ?? const <String, Object?>{},
      };
    }

    if (frontReviewImage != null) {
      final verificationResultJson = decodedId["verificationResult"] as Map<String, dynamic>;
      if (verificationResultJson["dataConsistencyResult"] != null) {
        final dataConsistencyResultJson = verificationResultJson["dataConsistencyResult"] as Map<String, dynamic>;
        dataConsistencyResultJson["frontReviewImage"] = frontReviewImage;
      }
    }

    return CapturedId.fromJSON(decodedId);
  }

  Future<void> _notifyDidCaptureId(CapturedId capturedId) async {
    for (var listener in _idCapture._listeners.toList()) {
      await listener.didCaptureId(_idCapture, capturedId);
    }
  }

  Future<void> _notifyDidRejectId(CapturedId? capturedId, RejectionReason reason) async {
    for (var listener in _idCapture._listeners.toList()) {
      await listener.didRejectId(_idCapture, capturedId, reason);
    }
  }

  void setModeEnabledState(bool newValue) {
    idMethodHandler.setModeEnabledState(modeId: _idCapture._modeId, enabled: newValue).onError(onError);
  }

  Future<void> applyNewSettings(IdCaptureSettings settings) {
    return idMethodHandler
        .applyIdCaptureModeSettings(modeId: _idCapture._modeId, settingsJson: jsonEncode(settings.toMap()))
        .onError(onError);
  }

  Future<void> updateIdCaptureMode() {
    return idMethodHandler
        .updateIdCaptureMode(modeId: _idCapture._modeId, modeJson: jsonEncode(_idCapture.toMap()))
        .onError(onError);
  }

  Future<void> updateFeedback(IdCaptureFeedback feedback) {
    return idMethodHandler
        .updateFeedback(modeId: _idCapture._modeId, feedbackJson: jsonEncode(feedback.toMap()))
        .onError(onError);
  }
}
