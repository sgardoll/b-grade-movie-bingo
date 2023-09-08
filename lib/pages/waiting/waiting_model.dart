import '/backend/backend.dart';
import '/components/players_widget.dart';
import '/components/start_game_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WaitingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Players component.
  late PlayersModel playersModel;
  // Model for StartGame component.
  late StartGameModel startGameModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    playersModel = createModel(context, () => PlayersModel());
    startGameModel = createModel(context, () => StartGameModel());
  }

  void dispose() {
    unfocusNode.dispose();
    playersModel.dispose();
    startGameModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
