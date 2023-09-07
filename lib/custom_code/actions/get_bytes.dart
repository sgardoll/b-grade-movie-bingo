// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<FFUploadedFile> getBytes(String? audioPath) async {
  if (audioPath == null) {
    throw Exception('Audio path cannot be null');
  }

  // Get the file from the audio path
  final file = await backend.getFile(audioPath);

  // Read the file as bytes
  final bytes = await file.readAsBytes();

  return bytes;
}
