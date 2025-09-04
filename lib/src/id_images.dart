/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:scandit_flutter_datacapture_id/src/id_side.dart';

class IdImages {
  final String? _frontFaceImageEncoded;
  final String? _frontFrameEncoded;
  final String? _backFrameEncoded;
  final String? _croppedDocumentFrontFrameEncoded;
  final String? _croppedDocumentBackFrameEncoded;

  IdImages._(
    this._frontFaceImageEncoded,
    this._frontFrameEncoded,
    this._backFrameEncoded,
    this._croppedDocumentFrontFrameEncoded,
    this._croppedDocumentBackFrameEncoded,
  );

  factory IdImages.fromJSON(Map<String, dynamic> json) {
    String? frontFaceImageEncoded;
    String? frontFrameEncoded;
    String? backFrameEncoded;
    String? croppedDocumentFrontFrameEncoded;
    String? croppedDocumentBackFrameEncoded;

    if (json["front"] != null) {
      frontFaceImageEncoded = json["front"]["face"];
      frontFrameEncoded = json["front"]["frame"];
      croppedDocumentFrontFrameEncoded = json["front"]["croppedDocument"];
    }
    if (json["back"] != null) {
      backFrameEncoded = json["back"]["frame"];
      croppedDocumentBackFrameEncoded = json["back"]["croppedDocument"];
    }
    return IdImages._(
      frontFaceImageEncoded,
      frontFrameEncoded,
      backFrameEncoded,
      croppedDocumentFrontFrameEncoded,
      croppedDocumentBackFrameEncoded,
    );
  }

  Image? _frontFace;

  Image? get face {
    if (_frontFace != null) return _frontFace;
    if (_frontFaceImageEncoded != null) {
      _frontFace = _createImageFromSource(_frontFaceImageEncoded);
    }
    return _frontFace;
  }

  Image? _frontFrame;

  Image? get frame {
    if (_frontFrame != null) return _frontFrame;
    if (_frontFrameEncoded != null) {
      _frontFrame = _createImageFromSource(_frontFrameEncoded);
    }
    return _frontFrame;
  }

  Image? _frontCropped;

  Image? _backCropped;

  Image? getCroppedDocument(IdSide side) {
    switch (side) {
      case IdSide.front:
        if (_frontCropped != null) return _frontCropped;
        if (_croppedDocumentFrontFrameEncoded != null) {
          _frontCropped = _createImageFromSource(_croppedDocumentFrontFrameEncoded);
        }
        return _frontCropped;
      case IdSide.back:
        if (_backCropped != null) return _backCropped;
        if (_croppedDocumentBackFrameEncoded != null) {
          _backCropped = _createImageFromSource(_croppedDocumentBackFrameEncoded);
        }
        return _backCropped;
    }
  }

  Image? _backFrame;

  Image? getFrame(IdSide side) {
    switch (side) {
      case IdSide.front:
        if (_frontFrame != null) return _frontFrame;
        if (_frontFrameEncoded != null) {
          _frontFrame = _createImageFromSource(_frontFrameEncoded);
        }
        return _frontFrame;
      case IdSide.back:
        if (_backFrame != null) return _backFrame;
        if (_backFrameEncoded != null) {
          _backFrame = _createImageFromSource(_backFrameEncoded);
        }
        return _backFrame;
    }
  }

  /// Creates an Image widget from either a base64-encoded string or a file path.
  ///
  /// Automatically detects the source type:
  /// - If the source starts with common file path patterns (/), treats it as a file path
  /// - If the source contains base64 padding (=) or is valid base64, treats it as base64
  /// - Optimizes loading with error handling for both cases
  Image? _createImageFromSource(String? source) {
    if (source == null || source.isEmpty) return null;

    try {
      if (_isFilePath(source)) {
        // Normalize potential file:// URIs
        String path = source;
        if (source.startsWith('file://')) {
          try {
            path = Uri.parse(source).toFilePath();
          } catch (_) {
            path = source.replaceFirst('file://', '');
          }
        }
        final file = File(path);
        if (file.existsSync()) {
          return Image.file(
            file,
            errorBuilder: (context, error, stackTrace) {
              // Fallback to base64 if file loading fails
              return _createImageFromBase64(source);
            },
          );
        }
      }

      // Try as base64
      return _createImageFromBase64(source);
    } catch (e) {
      // Return null if both methods fail
      return null;
    }
  }

  /// Determines if a string represents a file path
  bool _isFilePath(String source) {
    // Check for common file path patterns
    return source.startsWith('/') ||
        source.startsWith('file://') ||
        source.contains('\\') || // Windows paths
        (source.length > 1 && source[1] == ':'); // Windows drive letters
  }

  /// Creates an Image from base64 string with error handling
  Image _createImageFromBase64(String base64String) {
    try {
      final bytes = base64Decode(base64String);
      return Image.memory(
        bytes,
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      );
    } on FormatException {
      return Image(
        image: MemoryImage(Uint8List.fromList([0])),
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      );
    }
  }
}
