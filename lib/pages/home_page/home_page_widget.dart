import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/game_swipe_widget.dart';
import '/components/neon_sign_widget.dart';
import '/components/start_enter_movie_and_name_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'neonSignOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'carouselOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        TiltEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0, -3.142),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().gameSelected = null;
        FFAppState().gameIsSelected = false;
        FFAppState().gameColor = FlutterFlowTheme.of(context).primary;
      });
    });

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

    return FutureBuilder<List<CardsRecord>>(
      future: FFAppState().cardsQuery(
        requestFn: () => queryCardsRecordOnce(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<CardsRecord> homePageCardsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.rotate(
                              angle: 6.161,
                              alignment: Alignment(-3.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, -2.00),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 200.0,
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(0.00, 1.00),
                                  child: Align(
                                    alignment:
                                        AlignmentDirectional(0.00, -0.00),
                                    child: wrapWithModel(
                                      model: _model.neonSignModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: NeonSignWidget(
                                        lightColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        signText: 'PICK A GAME',
                                        color: FlutterFlowTheme.of(context)
                                            .cultured,
                                        signBgColor: valueOrDefault<Color>(
                                          FFAppState().gameColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'neonSignOnPageLoadAnimation']!),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Builder(
                            builder: (context) {
                              final cards = homePageCardsRecordList
                                  .map((e) => e)
                                  .toList();
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: CarouselSlider.builder(
                                  itemCount: cards.length,
                                  itemBuilder: (context, cardsIndex, _) {
                                    final cardsItem = cards[cardsIndex];
                                    return wrapWithModel(
                                      model: _model.gameSwipeModels.getModel(
                                        cardsItem.reference.id,
                                        cardsIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: GameSwipeWidget(
                                        key: Key(
                                          'Keyhcg_${cardsItem.reference.id}',
                                        ),
                                        color: cardsItem.color!,
                                        image: cardsItem.image,
                                        icon: Icon(
                                          Icons.movie_filter,
                                          size: 24.0,
                                        ),
                                        gameRef: cardsItem.reference,
                                      ),
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselController(),
                                  options: CarouselOptions(
                                    initialPage: min(5, cards.length - 1),
                                    viewportFraction: 0.66,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.33,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) async {
                                      _model.carouselCurrentIndex = index;
                                      setState(() {
                                        FFAppState().gameIsSelected = false;
                                      });
                                      setState(() {
                                        FFAppState().gameSelected = null;
                                      });
                                    },
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'carouselOnPageLoadAnimation']!);
                            },
                          ),
                        ),
                        if (valueOrDefault<bool>(
                          FFAppState().gameIsSelected == true ? true : false,
                          false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.elasticOut,
                              width: double.infinity,
                              height: 210.0,
                              decoration: BoxDecoration(),
                              child: StreamBuilder<CardsRecord>(
                                stream: CardsRecord.getDocument(
                                    FFAppState().gameSelected!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnButtonsCardsRecord =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Transform.rotate(
                                          angle: 6.1959,
                                          origin: Offset(-17.0, 0.0),
                                          child: Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                var playersRecordReference =
                                                    PlayersRecord.collection
                                                        .doc();
                                                await playersRecordReference.set(
                                                    createPlayersRecordData());
                                                _model.newPlayerRefStart =
                                                    PlayersRecord.getDocumentFromData(
                                                        createPlayersRecordData(),
                                                        playersRecordReference);
                                                setState(() {
                                                  FFAppState().playerRef =
                                                      _model.newPlayerRefStart
                                                          ?.reference;
                                                });
                                                await showAlignedDialog(
                                                  barrierColor:
                                                      Color(0xC0000000),
                                                  barrierDismissible: false,
                                                  context: context,
                                                  isGlobal: true,
                                                  avoidOverflow: true,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              0.0, -1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              0.0, -1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: GestureDetector(
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode),
                                                        child:
                                                            StartEnterMovieAndNameWidget(
                                                          color:
                                                              columnButtonsCardsRecord
                                                                  .color!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () =>
                                                        _model.leadPlayerName =
                                                            value));

                                                if (_model.leadPlayerName !=
                                                    null) {
                                                  await _model
                                                      .newPlayerRefStart!
                                                      .reference
                                                      .update(
                                                          createPlayersRecordData(
                                                    playerName: _model
                                                        .leadPlayerName
                                                        ?.leadPlayerName,
                                                  ));
                                                  _model.joinCode5Digits =
                                                      await actions
                                                          .getRandomString(
                                                    5,
                                                  );

                                                  context.pushNamed(
                                                    'Start',
                                                    queryParameters: {
                                                      'joinCode':
                                                          serializeParam(
                                                        _model.joinCode5Digits,
                                                        ParamType.String,
                                                      ),
                                                      'leadPlayerRef':
                                                          serializeParam(
                                                        FFAppState().playerRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'cardGameRef':
                                                          serializeParam(
                                                        FFAppState()
                                                            .gameSelected,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'color': serializeParam(
                                                        valueOrDefault<Color>(
                                                          columnButtonsCardsRecord
                                                              .color,
                                                          Color(0xFFFF0000),
                                                        ),
                                                        ParamType.Color,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Nothing was entered',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              text: 'START',
                                              options: FFButtonOptions(
                                                width: 200.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  columnButtonsCardsRecord
                                                      .color,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Neon Glow',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cultured,
                                                      fontSize: 30.0,
                                                      useGoogleFonts: false,
                                                    ),
                                                elevation: 6.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                    'buttonOnPageLoadAnimation1']!),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Transform.rotate(
                                          angle: 0.0349,
                                          origin: Offset(17.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'join',
                                                pathParameters: {
                                                  'joinCode': serializeParam(
                                                    'IIIII',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                queryParameters: {
                                                  'color': serializeParam(
                                                    valueOrDefault<Color>(
                                                      columnButtonsCardsRecord
                                                          .color,
                                                      Color(0xFFFF0000),
                                                    ),
                                                    ParamType.Color,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'JOIN',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                columnButtonsCardsRecord.color,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Neon Glow',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .cultured,
                                                        fontSize: 30.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              elevation: 6.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'buttonOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 15.0))
                                        .addToStart(SizedBox(height: 16.0))
                                        .addToEnd(SizedBox(height: 16.0)),
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!);
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: FlutterFlowAdBanner(
                    height: 100.0,
                    showsTestAd: false,
                    iOSAdUnitID: 'ca-app-pub-3945304154369399/7913434099',
                    androidAdUnitID: 'ca-app-pub-3945304154369399/2976766794',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
