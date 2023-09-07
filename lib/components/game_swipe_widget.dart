import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_swipe_model.dart';
export 'game_swipe_model.dart';

class GameSwipeWidget extends StatefulWidget {
  const GameSwipeWidget({
    Key? key,
    Color? color,
    required this.gameRef,
    required this.image,
    required this.icon,
  })  : this.color = color ?? const Color(0xFF171C28),
        super(key: key);

  final Color color;
  final DocumentReference? gameRef;
  final String? image;
  final Widget? icon;

  @override
  _GameSwipeWidgetState createState() => _GameSwipeWidgetState();
}

class _GameSwipeWidgetState extends State<GameSwipeWidget>
    with TickerProviderStateMixin {
  late GameSwipeModel _model;

  final animationsMap = {
    'imageOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.5,
          end: 1.0,
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
    _model = createModel(context, () => GameSwipeModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Material(
                color: Colors.transparent,
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: 400.0,
                  height: 265.0,
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.color,
                      FlutterFlowTheme.of(context).secondary,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: valueOrDefault<Color>(
                          widget.color,
                          Color(0x31F5F5F5),
                        ),
                        offset: Offset(-4.0, 4.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: FutureBuilder<CardsRecord>(
                    future: CardsRecord.getDocumentOnce(widget.gameRef!),
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
                      final stackCardsRecord = snapshot.data!;
                      return Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  widget.image,
                                  'https://www.connectio.com.au/grateful/loading.png',
                                ),
                                width: 400.0,
                                height: 265.0,
                                fit: BoxFit.cover,
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['imageOnActionTriggerAnimation']!,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.updatePage(() {
                                _model.isSelected = true;
                              });
                              if (animationsMap[
                                      'imageOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap['imageOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              FFAppState().update(() {
                                FFAppState().gameSelected = widget.gameRef;
                                FFAppState().gameIsSelected = true;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                constraints: BoxConstraints(
                                  maxWidth: 400.0,
                                  maxHeight: 265.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x98FFFFFF),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.movie_sharp,
                                    color: valueOrDefault<Color>(
                                      widget.color,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              child: Container(
                                width: 400.0,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 24.0,
                                      color: Colors.black,
                                      offset: Offset(12.0, 0.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25.0),
                                    bottomRight: Radius.circular(25.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              stackCardsRecord.gameName,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: widget.color,
                                                        letterSpacing: 0.2,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            child: custom_widgets.SelectedIcon(
                                              width: 44.0,
                                              height: 44.0,
                                              isSelected: _model.isSelected,
                                              selectedColor: widget.color,
                                              unselectedColor:
                                                  Color(0x31F5F5F5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(width: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
