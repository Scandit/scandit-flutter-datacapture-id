/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'internal/id_capture_defaults.dart';
import 'internal/generated/id_log_metadata.dart';

// ignore: avoid_classes_with_only_static_members
/// The container class of the module. Includes only one method, which initializes the id and the core plugins.
///
/// Added in version 6.11.0
class ScanditFlutterDataCaptureId {
  /// Initializes the core and the id plugins. You need to invoke this method before accessing any of the Scandit Data Capture SDK functionality.
  ///
  /// Added in version 6.11.0
  static Future<void> initialize() async {
    await ScanditFlutterDataCaptureCore.initialize();
    registerIdLogMetadata();
    await IdCaptureDefaults.initializeDefaults();
  }
}
