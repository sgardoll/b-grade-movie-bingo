import '/backend/backend.dart';
import '/components/game_swipe_widget.dart';
import '/components/neon_sign_widget.dart';
import '/components/start_enter_name_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:aligned_dialog/aligned_dialog.dart';
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
    'pageViewOnPageLoadAnimation': AnimationInfo(
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
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().gameSelected = null;
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent4,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Stack(
                      children: [],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.bounceOut,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 150.0, 0.0, 0.0),
                                      child: StreamBuilder<List<CardsRecord>>(
                                        stream: FFAppState().cardsQuery(
                                          requestFn: () => queryCardsRecord(),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<CardsRecord>
                                              pageViewCardsRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 40.0),
                                                  child: PageView.builder(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                pageViewCardsRecordList
                                                                        .length -
                                                                    1)),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        pageViewCardsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        pageViewIndex) {
                                                      final pageViewCardsRecord =
                                                          pageViewCardsRecordList[
                                                              pageViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        child: GameSwipeWidget(
                                                          key: Key(
                                                              'Keyk8s_${pageViewIndex}_of_${pageViewCardsRecordList.length}'),
                                                          color:
                                                              pageViewCardsRecord
                                                                  .color!,
                                                          image:
                                                              pageViewCardsRecord
                                                                  .image,
                                                          icon: Icon(
                                                            Icons.movie_filter,
                                                            size: 24.0,
                                                          ),
                                                          gameRef:
                                                              pageViewCardsRecord
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 32.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: min(
                                                                  0,
                                                                  pageViewCardsRecordList
                                                                          .length -
                                                                      1)),
                                                      count:
                                                          pageViewCardsRecordList
                                                              .length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewController!
                                                            .animateToPage(
                                                          i,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      effect: smooth_page_indicator
                                                          .ExpandingDotsEffect(
                                                        expansionFactor: 3.0,
                                                        spacing: 8.0,
                                                        radius: 16.0,
                                                        dotWidth: 16.0,
                                                        dotHeight: 8.0,
                                                        dotColor:
                                                            Color(0x40FFFFFF),
                                                        activeDotColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        paintStyle:
                                                            PaintingStyle.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'pageViewOnPageLoadAnimation']!);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.elasticOut,
                            width: double.infinity,
                            height: 170.0,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: valueOrDefault<bool>(
                                FFAppState().gameIsSelected ? true : false,
                                false,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.rotate(
                                      angle: 6.1959,
                                      child: Visibility(
                                        visible: valueOrDefault<bool>(
                                          FFAppState().gameIsSelected
                                              ? true
                                              : false,
                                          false,
                                        ),
                                        child: Builder(
                                          builder: (context) => FFButtonWidget(
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
                                                FFAppState().playerRef = _model
                                                    .newPlayerRefStart
                                                    ?.reference;
                                              });
                                              await showAlignedDialog(
                                                barrierColor: Color(0xC0000000),
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
                                                          StartEnterNameWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => setState(() =>
                                                  _model.leadPlayerName =
                                                      value));

                                              if (_model.leadPlayerName !=
                                                      null &&
                                                  _model.leadPlayerName != '') {
                                                await _model.newPlayerRefStart!
                                                    .reference
                                                    .update(
                                                        createPlayersRecordData(
                                                  playerName:
                                                      _model.leadPlayerName,
                                                ));
                                                _model.joinCode5Digits =
                                                    await actions
                                                        .getRandomString(
                                                  5,
                                                );

                                                context.pushNamed(
                                                  'Start',
                                                  queryParameters: {
                                                    'joinCode': serializeParam(
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
                                                      FFAppState().gameSelected,
                                                      ParamType
                                                          .DocumentReference,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Neon Glow',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                    Transform.rotate(
                                      angle: 0.0349,
                                      child: Visibility(
                                        visible: valueOrDefault<bool>(
                                          FFAppState().gameIsSelected
                                              ? true
                                              : false,
                                          false,
                                        ),
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
                                            );
                                          },
                                          text: 'JOIN',
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Neon Glow',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                      .divide(SizedBox(height: 32.0))
                                      .addToStart(SizedBox(height: 16.0))
                                      .addToEnd(SizedBox(height: 16.0)),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
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
                              lightColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              signText: 'PICK A GAME',
                              color: FlutterFlowTheme.of(context).primary,
                              signBgColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['neonSignOnPageLoadAnimation']!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
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
      ),
    );
  }
}
