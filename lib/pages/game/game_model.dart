import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_pick_widget.dart';
import '/components/neon_sign_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String initial = '?';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Card widget.
  String? cardAudio;
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
