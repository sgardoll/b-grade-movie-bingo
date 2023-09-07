import '/backend/backend.dart';
import '/components/game_swipe_widget.dart';
import '/components/neon_sign_widget.dart';
import '/components/start_enter_name_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NeonSign component.
  late NeonSignModel neonSignModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Create Document] action in ButtonStart widget.
  PlayersRecord? newPlayerRefStart;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ButtonStart widget.
  String? leadPlayerName;
  // Stores action output result for [Custom Action - getRandomString] action in ButtonStart widget.
  String? joinCode5Digits;

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
