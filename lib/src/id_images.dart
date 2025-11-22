/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/widgets.dart';
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
      _frontFace = Image.memory(base64Decode(_frontFaceImageEncoded));
    }
    return _frontFace;
  }

  Image? _frontFrame;

  Image? get frame {
    if (_frontFrame != null) return _frontFrame;
    if (_frontFrameEncoded != null) {
      _frontFrame = Image.memory(base64Decode(_frontFrameEncoded));
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
          _frontCropped = Image.memory(base64Decode(_croppedDocumentFrontFrameEncoded));
        }
        return _frontCropped;
      case IdSide.back:
        if (_backCropped != null) return _backCropped;
        if (_croppedDocumentBackFrameEncoded != null) {
          _backCropped = Image.memory(base64Decode(_croppedDocumentBackFrameEncoded));
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
          _frontFrame = Image.memory(base64Decode(_frontFrameEncoded));
        }
        return _frontFrame;
      case IdSide.back:
        if (_backFrame != null) return _backFrame;
        if (_backFrameEncoded != null) {
          _backFrame = Image.memory(base64Decode(_backFrameEncoded));
        }
        return _backFrame;
    }
  }
}
