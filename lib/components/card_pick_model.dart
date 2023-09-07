import '/backend/backend.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class CardPickModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  Record? audioRecorder;
  // Model for ProgressBar component.
  late ProgressBarModel progressBarModel;
  String? cancelAudioRec;
  String? stopAudioSubmit;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    progressBarModel = createModel(context, () => ProgressBarModel());
  }

  void dispose() {
    progressBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
