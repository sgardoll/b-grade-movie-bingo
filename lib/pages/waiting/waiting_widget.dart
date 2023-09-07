import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/players_widget.dart';
import '/components/start_game_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'waiting_model.dart';
export 'waiting_model.dart';

class WaitingWidget extends StatefulWidget {
  const WaitingWidget({
    Key? key,
    required this.playerRef,
    required this.beingPlayedDoc,
    required this.cardGameRef,
  }) : super(key: key);

  final DocumentReference? playerRef;
  final BeingPlayedRecord? beingPlayedDoc;
  final DocumentReference? cardGameRef;

  @override
  _WaitingWidgetState createState() => _WaitingWidgetState();
}

class _WaitingWidgetState extends State<WaitingWidget> {
  late WaitingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "ca-app-pub-3945304154369399/3992454660",
        "ca-app-pub-3945304154369399/2977864274",
        false,
      );
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

    return StreamBuilder<BeingPlayedRecord>(
      stream: BeingPlayedRecord.getDocument(widget.beingPlayedDoc!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).accent4,
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
        final waitingBeingPlayedRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.safePop();
                },
              ),
              title: Text(
                'Waiting Room',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Your fellow players are',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Expanded(
                      child: wrapWithModel(
                        model: _model.playersModel,
                        updateCallback: () => setState(() {}),
                        child: PlayersWidget(
                          leadPlayerRef: waitingBeingPlayedRecord.leadPlayer!,
                          beingPlayedRef: widget.beingPlayedDoc!.reference,
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      widget.beingPlayedDoc?.status == 'Waiting',
                      true,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          'Waiting for team lead to start the movie.\n\nYour game will begin when they hit the start button.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      waitingBeingPlayedRecord.status == 'Started',
                      false,
                    ))
                      wrapWithModel(
                        model: _model.startGameModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: StartGameWidget(
                          beingPlayedRef: waitingBeingPlayedRecord.reference,
                          cardsDocRef: widget.cardGameRef!,
                        ),
                      ),
                    FlutterFlowAdBanner(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      showsTestAd: false,
                      iOSAdUnitID: 'ca-app-pub-3945304154369399/7913434099',
                      androidAdUnitID: 'ca-app-pub-3945304154369399/2976766794',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
