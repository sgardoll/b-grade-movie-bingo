import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/game_swipe_widget.dart';
import '/components/neon_sign_widget.dart';
import '/components/start_enter_movie_and_name_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 5;

  // Models for GameSwipe dynamic component.
  late FlutterFlowDynamicModels<GameSwipeModel> gameSwipeModels;
  // Stores action output result for [Backend Call - Create Document] action in ButtonStart widget.
  PlayersRecord? newPlayerRefStart;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ButtonStart widget.
  LeadPlayerAndMovieStruct? leadPlayerName;
  // Stores action output result for [Custom Action - getRandomString] action in ButtonStart widget.
  String? joinCode5Digits;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    neonSignModel = createModel(context, () => NeonSignModel());
    gameSwipeModels = FlutterFlowDynamicModels(() => GameSwipeModel());
  }

  void dispose() {
    unfocusNode.dispose();
    neonSignModel.dispose();
    gameSwipeModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
