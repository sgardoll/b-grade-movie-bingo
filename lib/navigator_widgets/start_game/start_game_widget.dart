import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_game_model.dart';
export 'start_game_model.dart';

class StartGameWidget extends StatefulWidget {
  const StartGameWidget({
    Key? key,
    required this.beingPlayedRef,
    required this.cardsDocRef,
  }) : super(key: key);

  final DocumentReference? beingPlayedRef;
  final DocumentReference? cardsDocRef;

  @override
  _StartGameWidgetState createState() => _StartGameWidgetState();
}

class _StartGameWidgetState extends State<StartGameWidget> {
  late StartGameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartGameModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      HapticFeedback.vibrate();

      _model.interstitialAdSuccessCopy2 = await admob.showInterstitialAd();

      if (_model.interstitialAdSuccessCopy2!) {
        context.goNamed(
          'Game',
          queryParameters: {
            'beingPlayedRef': serializeParam(
              widget.beingPlayedRef,
              ParamType.DocumentReference,
            ),
            'cardsDoc': serializeParam(
              widget.cardsDocRef,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Something went wrong',
              style: GoogleFonts.getFont(
                'Outfit',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
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
