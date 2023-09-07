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
import 'package:firebase_storage/firebase_storage.dart';

Future<FFUploadedFile> getFileFromPath(String? audioPath) async {
  if (audioPath == null) {
    throw Exception('Audio path cannot be null');
  }

  // Get the file from the audio path using Firebase Storage
  final ref = FirebaseStorage.instance.ref().child(audioPath);
  final downloadUrl = await ref.getDownloadURL();
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/$audioPath');

  final data = await ref.getData();
  await file.writeAsBytes(data);

  return file;
}
