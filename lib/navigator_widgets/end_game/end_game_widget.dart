import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'end_game_model.dart';
export 'end_game_model.dart';

class EndGameWidget extends StatefulWidget {
  const EndGameWidget({
    Key? key,
    required this.beingPlayedRef,
    required this.cardsDocRef,
  }) : super(key: key);

  final DocumentReference? beingPlayedRef;
  final DocumentReference? cardsDocRef;

  @override
  _EndGameWidgetState createState() => _EndGameWidgetState();
}

class _EndGameWidgetState extends State<EndGameWidget> {
  late EndGameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EndGameModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      HapticFeedback.vibrate();

      context.goNamed(
        'Summary',
        queryParameters: {
          'beingPlayedRef': serializeParam(
            widget.beingPlayedRef,
            ParamType.DocumentReference,
          ),
          'color': serializeParam(
            FFAppState().gameColor,
            ParamType.Color,
          ),
        }.withoutNulls,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
