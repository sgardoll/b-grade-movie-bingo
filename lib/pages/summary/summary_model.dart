import '/backend/backend.dart';
import '/components/card_summary_widget.dart';
import '/components/neon_sign_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SummaryModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String initial = '?';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NeonSign component.
  late NeonSignModel neonSignModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    neonSignModel = createModel(context, () => NeonSignModel());
  }

  void dispose() {
    unfocusNode.dispose();
    neonSignModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
