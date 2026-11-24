/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

// Warn-once keys, scoped by "<logPrefix>.<event>" so one malformed payload logs once per
// controller+event for the process rather than once per controller instance.
final Set<String> _warnedSchemaValidationEvents = {};

/// Parses a bridge event payload with the generated schema class, falling back to a raw-map
/// reading when the strict parser rejects it.
///
/// The generated schema classes have required fields, so a throw from [parse] would escape into
/// the stream listener — on an ack-owing path that strands native until it times out. [fallback]
/// therefore gets a chance to reconstruct the payload, and returns null to DECLINE the event when
/// a required field is missing or the wrong type: fabricating a placeholder there only moves the
/// failure one line down (an empty string handed to `jsonDecode`) or reports a bogus value.
/// Callers must treat a null return as "skip this event", while still honouring any ack they owe.
///
/// Internal to this package; the same helper exists per module until the bridge plumbing grows a
/// shared home in core. [SDC-32668]
T? parsePayloadTolerantly<T>(
  Map<String, dynamic> raw,
  T Function(Object?) parse,
  T? Function(Object?) fallback,
  String event,
  String logPrefix,
) {
  try {
    return parse(raw);
  } catch (error) {
    if (_warnedSchemaValidationEvents.add('$logPrefix.$event')) {
      developer.log('$logPrefix $event payload failed schema validation: $error');
    }
    final fallbackValue = fallback(raw);
    if (fallbackValue == null && _warnedSchemaValidationEvents.add('$logPrefix.$event.declined')) {
      developer.log('$logPrefix $event payload declined: required field missing/invalid');
    }
    return fallbackValue;
  }
}

/// Logs [message] the first time this ([logPrefix], [key]) pair is seen, sharing the warn-once
/// bookkeeping with [parsePayloadTolerantly] so a repeating per-frame payload problem costs one
/// log line rather than one per frame.
void logPayloadIssueOnce(String logPrefix, String key, String message) {
  if (_warnedSchemaValidationEvents.add('$logPrefix.$key')) {
    developer.log('$logPrefix $message');
  }
}

/// Clears the warn-once bookkeeping. Without this a test that asserts on the log sees nothing
/// once an earlier test in the same process has already tripped the same key.
@visibleForTesting
void resetPayloadParserWarnings() => _warnedSchemaValidationEvents.clear();
