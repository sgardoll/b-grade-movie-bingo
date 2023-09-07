import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayersModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String leadPlayer = '-';

  List<String> remainingPlayers = [];
  void addToRemainingPlayers(String item) => remainingPlayers.add(item);
  void removeFromRemainingPlayers(String item) => remainingPlayers.remove(item);
  void removeAtIndexFromRemainingPlayers(int index) =>
      remainingPlayers.removeAt(index);
  void updateRemainingPlayersAtIndex(int index, Function(String) updateFn) =>
      remainingPlayers[index] = updateFn(remainingPlayers[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
