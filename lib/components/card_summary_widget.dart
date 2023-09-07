import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        widget.cardText!,
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ),
                        child: Text(
                          'at around ${dateTimeFormat(
                            'relative',
                            DateTime.fromMillisecondsSinceEpoch(widget
                                    .gameStartedTimestamp!
                                    .millisecondsSinceEpoch -
                                widget.timestamp!.millisecondsSinceEpoch),
                            locale: FFLocalizations.of(context).languageCode,
                          )}',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Manrope',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (valueOrDefault<bool>(
                _model.isPlaying == true ? true : false,
                false,
              ))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.soundPlayer?.stop();
                    setState(() {
                      _model.isPlaying = false;
                    });
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Color(0x98FFFFFF),
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.stop_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                _model.isPlaying == false ? true : false,
                true,
              ))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.isPlaying = true;
                    _model.soundPlayer ??= AudioPlayer();
                    if (_model.soundPlayer!.playing) {
                      await _model.soundPlayer!.stop();
                    }
                    _model.soundPlayer!.setVolume(1.0);
                    await _model.soundPlayer!
                        .setUrl(widget.audio!)
                        .then((_) => _model.soundPlayer!.play());

                    setState(() {
                      _model.isPlaying = false;
                    });
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Color(0x98FFFFFF),
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.play_arrow,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
            ]
                .divide(SizedBox(width: 8.0))
                .addToStart(SizedBox(width: 8.0))
                .addToEnd(SizedBox(width: 8.0)),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
