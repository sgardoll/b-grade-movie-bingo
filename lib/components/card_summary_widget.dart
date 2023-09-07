import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _CardSummaryWidgetState extends State<CardSummaryWidget>
    with TickerProviderStateMixin {
  late CardSummaryModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0, 1.571),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: Color(0xC0FFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x34090F13),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: FlutterFlowAudioPlayer(
              audio: Audio.network(
                widget.audio!,
                metas: Metas(
                  id: '2vqf7_-b99c54fa',
                  title: widget.cardText,
                ),
              ),
              titleTextStyle: FlutterFlowTheme.of(context).titleLarge,
              playbackDurationTextStyle:
                  FlutterFlowTheme.of(context).labelMedium,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              playbackButtonColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).alternate,
              elevation: 4.0,
              playInBackground: PlayInBackground.disabledRestoreOnForeground,
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
