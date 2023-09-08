import '/backend/backend.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'card_pick_model.dart';
export 'card_pick_model.dart';

class CardPickWidget extends StatefulWidget {
  const CardPickWidget({
    Key? key,
    required this.cardRef,
    this.index,
    required this.color,
  }) : super(key: key);

  final DocumentReference? cardRef;
  final int? index;
  final Color? color;

  @override
  _CardPickWidgetState createState() => _CardPickWidgetState();
}

class _CardPickWidgetState extends State<CardPickWidget>
    with TickerProviderStateMixin {
  late CardPickModel _model;

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
    _model = createModel(context, () => CardPickModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!isWeb) {
        _model.audioRecorder ??= Record();
        if (await _model.audioRecorder!.hasPermission()) {
          await _model.audioRecorder!.start();
        } else {
          showSnackbar(
            context,
            'You have not provided permission to record audio.',
          );
        }
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

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2.0,
        sigmaY: 2.0,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
        child: FutureBuilder<CardsRecord>(
          future: CardsRecord.getDocumentOnce(widget.cardRef!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitRipple(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
              );
            }
            final projectCardCardsRecord = snapshot.data!;
            return Container(
              width: 230.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x34090F13),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 36.0,
                                      height: 36.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x98FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Icon(
                                        Icons.movie,
                                        color: widget.color,
                                        size: 20.0,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.progressBarModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: ProgressBarWidget(
                                        parameter1: widget.color!,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            projectCardCardsRecord
                                                .cardsTexts[widget.index!],
                                            '0',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: ClipRRect(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (!isWeb) {
                                      _model.cancelAudioRec =
                                          await _model.audioRecorder?.stop();
                                    }
                                    Navigator.pop(context);

                                    setState(() {});
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (isWeb) {
                                      Navigator.pop(context);
                                    } else {
                                      _model.stopAudioSubmit =
                                          await _model.audioRecorder?.stop();
                                      Navigator.pop(
                                          context, _model.stopAudioSubmit);
                                    }

                                    setState(() {});
                                  },
                                  text: 'Select',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      widget.color,
                                      FlutterFlowTheme.of(context).secondary,
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
          },
        ),
      ),
    );
  }
}
