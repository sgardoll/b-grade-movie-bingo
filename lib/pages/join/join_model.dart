import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/start_enter_name_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JoinModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? joinCode = 'IIIII';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldJoinCode widget.
  TextEditingController? textFieldJoinCodeController;
  String? Function(BuildContext, String?)? textFieldJoinCodeControllerValidator;
  String? _textFieldJoinCodeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '5 digit join code required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  var qrScanOutput = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BeingPlayedRecord? findBeingPlayed2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PlayersRecord? newPlayerRefJoin;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? leadPlayerNameJoin;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldJoinCodeControllerValidator =
        _textFieldJoinCodeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldJoinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
