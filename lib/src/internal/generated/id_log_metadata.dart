/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

// THIS FILE IS GENERATED. DO NOT EDIT MANUALLY.
// Generator: scripts/bridge_generator/generate.py
// Schema: scripts/bridge_generator/schemas/id.json

// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/logging/logging.dart';

/// Per-method `LogRecord` level and category overrides for the Id
/// bridge surface. Consumed by `LoggingMethodChannel` (via
/// `ScanditLogger.getMethodMetadata`): per-frame / per-scan callbacks log at
/// [LogLevel.trace] under their category label, so they only show once the
/// level is raised to [LogLevel.trace] (mirrors the TS `wrapNativeProxy`
/// behaviour).
///
/// Keys are the **bare** method name, matching the TS `*ProxyLogMetadata.ts`
/// maps and the native `message` of records received over the batch channel.
///
/// Unlike the TS/JS side, Dart has no import-side-effect auto-registration:
/// an unimported file simply never runs. [registerIdLogMetadata]
/// must therefore be called explicitly — done once, from this plugin's own
/// bootstrap (`ScanditFlutterDataCaptureId.initialize()`).
const Map<String, MethodLogMetadata> idLogMetadata = {
  'finishDidCaptureCallback': MethodLogMetadata(level: LogLevel.trace, category: LogCategory.events),
  'finishDidRejectCallback': MethodLogMetadata(level: LogLevel.trace, category: LogCategory.events),
};

/// Registers [idLogMetadata] with [ScanditLogger]. Idempotent by
/// construction — it merges a `const` map of fixed keys, so calling it every
/// time this plugin's `initialize()` runs (e.g. once per dependent plugin
/// that bootstraps this one first) re-writes identical entries.
void registerIdLogMetadata() {
  ScanditLogger.registerMethodMetadata(idLogMetadata);
}
