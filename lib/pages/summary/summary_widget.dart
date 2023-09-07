import '/backend/backend.dart';
import '/components/card_summary_widget.dart';
import '/components/neon_sign_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'summary_model.dart';
export 'summary_model.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({
    Key? key,
    required this.beingPlayedRef,
  }) : super(key: key);

  final DocumentReference? beingPlayedRef;

  @override
  _SummaryWidgetState createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget>
    with TickerProviderStateMixin {
  late SummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'neonSignOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, -50.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummaryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<BeingPlayedRecord>(
      stream: BeingPlayedRecord.getDocument(widget.beingPlayedRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final summaryBeingPlayedRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StickyHeader(
                            overlapHeaders: false,
                            header: Transform.rotate(
                              angle: 6.161,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 158.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -2.0),
                                  child: wrapWithModel(
                                    model: _model.neonSignModel,
                                    updateCallback: () => setState(() {}),
                                    child: NeonSignWidget(
                                      lightColor: Color(0x31F5F5F5),
                                      signText: 'RESULTS',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      signBgColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'neonSignOnPageLoadAnimation']!),
                                ),
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Your Selections',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final yourSelections =
                                          summaryBeingPlayedRecord
                                              .playerSelections
                                              .where((e) =>
                                                  e.player ==
                                                  FFAppState().playerRef)
                                              .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: yourSelections.length,
                                        itemBuilder:
                                            (context, yourSelectionsIndex) {
                                          final yourSelectionsItem =
                                              yourSelections[
                                                  yourSelectionsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            child: CardSummaryWidget(
                                              key: Key(
                                                  'Keyocy_${yourSelectionsIndex}_of_${yourSelections.length}'),
                                              cardText:
                                                  yourSelectionsItem.cardText,
                                              audio:
                                                  yourSelectionsItem.audioPath,
                                              timestamp:
                                                  yourSelectionsItem.timestamp!,
                                              gameStartedTimestamp:
                                                  summaryBeingPlayedRecord
                                                      .timeStarted!,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Your Group Selected',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final friendsSelections =
                                          summaryBeingPlayedRecord
                                              .playerSelections
                                              .where((e) =>
                                                  e.player !=
                                                  FFAppState().playerRef)
                                              .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: friendsSelections.length,
                                        itemBuilder:
                                            (context, friendsSelectionsIndex) {
                                          final friendsSelectionsItem =
                                              friendsSelections[
                                                  friendsSelectionsIndex];
                                          return StreamBuilder<PlayersRecord>(
                                            stream: PlayersRecord.getDocument(
                                                friendsSelectionsItem.player!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final columnPlayersRecord =
                                                  snapshot.data!;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '${columnPlayersRecord.playerName} \'s Selections',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final playSelections =
                                                            summaryBeingPlayedRecord
                                                                .playerSelections
                                                                .where((e) =>
                                                                    e.player ==
                                                                    friendsSelectionsItem
                                                                        .player)
                                                                .toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              playSelections
                                                                  .length,
                                                          itemBuilder: (context,
                                                              playSelectionsIndex) {
                                                            final playSelectionsItem =
                                                                playSelections[
                                                                    playSelectionsIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Text(
                                                                friendsSelectionsItem
                                                                    .cardText,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 8.0),
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.goNamed('HomePage');
                                                },
                                                text: 'Home',
                                                icon: Icon(
                                                  Icons.home_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 18.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              8.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 8.0))
                                              .addToStart(SizedBox(width: 32.0))
                                              .addToEnd(SizedBox(width: 32.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: FlutterFlowAdBanner(
                      height: 50.0,
                      showsTestAd: false,
                      iOSAdUnitID: 'ca-app-pub-3945304154369399/7913434099',
                      androidAdUnitID: 'ca-app-pub-3945304154369399/2976766794',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
