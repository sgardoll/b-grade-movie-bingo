import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_summary_model.dart';
export 'card_summary_model.dart';

class CardSummaryWidget extends StatefulWidget {
  const CardSummaryWidget({
    Key? key,
    required this.cardText,
    required this.audio,
    required this.timestamp,
    required this.gameStartedTimestamp,
  }) : super(key: key);

  final String? cardText;
  final String? audio;
  final DateTime? timestamp;
  final DateTime? gameStartedTimestamp;

  @override
  _CardSummaryWidgetState createState() => _CardSummaryWidgetState();
}

class _CardSummaryWidgetState extends State<CardSummaryWidget> {
  late CardSummaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardSummaryModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isPlaying = false;
      });
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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: FlutterFlowAudioPlayer(
        audio: Audio.network(
          widget.audio!,
          metas: Metas(
            id: '2vqf7_-b99c54fa',
            title: widget.cardText,
          ),
        ),
        titleTextStyle: FlutterFlowTheme.of(context).titleMedium.override(
              fontFamily: 'Manrope',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
        playbackDurationTextStyle: FlutterFlowTheme.of(context).labelSmall,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        playbackButtonColor: FlutterFlowTheme.of(context).primary,
        activeTrackColor: FlutterFlowTheme.of(context).alternate,
        elevation: 4.0,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
      ),
    );
  }
}
