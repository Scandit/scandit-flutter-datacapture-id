/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import '../scandit_flutter_datacapture_id.dart';

class IdCaptureSession {
  CapturedId? _newlyCapturedId;
  int _frameSequenceId;
  LocalizedOnlyId? _newlyLocalizedOnlyId;
  RejectedId? _newlyRejectedId;

  IdCaptureSession._(this._newlyCapturedId, this._newlyLocalizedOnlyId, this._newlyRejectedId, this._frameSequenceId);

  factory IdCaptureSession.fromJSON(Map<String, dynamic> json) {
    CapturedId? newlyCapturedId;
    if (json.containsKey("newlyCapturedId") && json["newlyCapturedId"] != null) {
      newlyCapturedId = CapturedId.fromJSON(json["newlyCapturedId"] as Map<String, dynamic>);
    }
    LocalizedOnlyId? newlyLocalizedOnlyId;
    if (json.containsKey("localizedOnlyId") && json["localizedOnlyId"] != null) {
      newlyLocalizedOnlyId = LocalizedOnlyId.fromJSON(json["localizedOnlyId"] as Map<String, dynamic>);
    }
    RejectedId? newlyRejectedId;
    if (json.containsKey("newlyRejectedId") && json["newlyRejectedId"] != null) {
      newlyRejectedId = RejectedId.fromJSON(json["newlyRejectedId"] as Map<String, dynamic>);
    }

    return IdCaptureSession._(newlyCapturedId, newlyLocalizedOnlyId, newlyRejectedId, json["frameSequenceId"] as int);
  }

  CapturedId? get newlyCapturedId {
    return _newlyCapturedId;
  }

  LocalizedOnlyId? get newlyLocalizedOnlyId {
    return _newlyLocalizedOnlyId;
  }

  RejectedId? get newlyRejectedId {
    return _newlyRejectedId;
  }

  int get frameSequenceId {
    return _frameSequenceId;
  }
}

class LocalizedOnlyId {
  Quadrilateral _location;

  LocalizedOnlyId._(this._location);

  LocalizedOnlyId.fromJSON(Map<String, dynamic> json)
      : this._(Quadrilateral.fromJSON(json["location"] as Map<String, dynamic>));

  Quadrilateral get location {
    return _location;
  }
}

class RejectedId {
  Quadrilateral _location;

  RejectedId._(this._location);

  RejectedId.fromJSON(Map<String, dynamic> json)
      : this._(Quadrilateral.fromJSON(json["location"] as Map<String, dynamic>));

  Quadrilateral get location {
    return _location;
  }
}

class IdCaptureError {
  String _type;
  String _message;

  IdCaptureError._(this._type, this._message);

  IdCaptureError.fromJSON(Map<String, dynamic> json) : this._(json["type"] as String, json["message"] as String);

  String get type {
    return _type;
  }

  String get message {
    return _message;
  }
}
