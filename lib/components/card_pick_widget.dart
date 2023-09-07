import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
      if (isWeb) {
        return;
      }

      _model.timerController.onExecute.add(StopWatchExecute.start);
      _model.audioRecorder ??= Record();
      if (await _model.audioRecorder!.hasPermission()) {
        await _model.audioRecorder!.start();
      } else {
        showSnackbar(
          context,
          'You have not provided permission to record audio.',
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
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.movie,
                                        color: widget.color,
                                        size: 20.0,
                                      ),
                                    ),
                                    Container(
                                      width: 150.0,
                                      height: 36.0,
                                      child: Stack(
                                        children: [
                                          FlutterFlowTimer(
                                            initialTime:
                                                _model.timerMilliseconds,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              minute: false,
                                            ),
                                            timer: _model.timerController,
                                            updateStateInterval:
                                                Duration(milliseconds: 500),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate) setState(() {});
                                            },
                                            onEnded: () async {
                                              _model.stopAudioTimerEnd =
                                                  await _model.audioRecorder
                                                      ?.stop();

                                              setState(() {});
                                            },
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Outfit',
                                              color: Colors.transparent,
                                              fontSize: 1.0,
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: LinearPercentIndicator(
                                              percent: valueOrDefault<double>(
                                                (int? timerMs,
                                                        int denominator) {
                                                  return (timerMs ?? 0) /
                                                      (denominator != null &&
                                                              denominator != 0
                                                          ? denominator
                                                          : 1);
                                                }(_model.timerMilliseconds,
                                                    (15000)),
                                                0.0,
                                              ),
                                              width: 150.0,
                                              lineHeight: 36.0,
                                              animation: false,
                                              progressColor: Color(0xA323262B),
                                              backgroundColor:
                                                  Color(0x98FFFFFF),
                                              barRadius: Radius.circular(12.0),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 38.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.keyboard_voice_rounded,
                                                color: widget.color,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
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
                                            AlignmentDirectional(0.0, 0.0),
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
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (await getPermissionStatus(
                                        microphonePermission)) {
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
                                      if (_model.stopAudioTimerEnd != null &&
                                              _model.stopAudioTimerEnd != ''
                                          ? true
                                          : false) {
                                        Navigator.pop(
                                            context, _model.stopAudioTimerEnd);
                                      } else {
                                        _model.cutAudioRecAndDismiss =
                                            await _model.audioRecorder?.stop();
                                        final selectedFiles = await selectFiles(
                                          allowedExtensions: ['mp3'],
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                            });
                                            showUploadMessage(
                                              context,
                                              'Success!',
                                            );
                                          } else {
                                            setState(() {});
                                            showUploadMessage(
                                              context,
                                              'Failed to upload file',
                                            );
                                            return;
                                          }
                                        }

                                        Navigator.pop(context,
                                            _model.cutAudioRecAndDismiss);
                                      }
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
