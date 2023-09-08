import '/backend/backend.dart';
import '/components/players_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'start_model.dart';
export 'start_model.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({
    Key? key,
    String? joinCode,
    required this.leadPlayerRef,
    required this.cardGameRef,
  })  : this.joinCode = joinCode ?? 'IIIII',
        super(key: key);

  final String joinCode;
  final DocumentReference? leadPlayerRef;
  final DocumentReference? cardGameRef;

  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  late StartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Start'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var beingPlayedRecordReference = BeingPlayedRecord.collection.doc();
      await beingPlayedRecordReference.set({
        ...createBeingPlayedRecordData(
          leadPlayer: widget.leadPlayerRef,
          status: 'Waiting',
          joinCode: widget.joinCode,
          cards: widget.cardGameRef,
        ),
        'timeStarted': FieldValue.serverTimestamp(),
      });
      _model.newBeingPlayedDoc = BeingPlayedRecord.getDocumentFromData({
        ...createBeingPlayedRecordData(
          leadPlayer: widget.leadPlayerRef,
          status: 'Waiting',
          joinCode: widget.joinCode,
          cards: widget.cardGameRef,
        ),
        'timeStarted': DateTime.now(),
      }, beingPlayedRecordReference);

      await widget.leadPlayerRef!.update(createPlayersRecordData(
        beingPlayedRef: _model.newBeingPlayedDoc?.reference,
      ));

      admob.loadInterstitialAd(
        "ca-app-pub-3945304154369399/3992454660",
        "ca-app-pub-3945304154369399/2977864274",
        false,
      );
    });

    _model.textController ??= TextEditingController(text: widget.joinCode);
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

    return StreamBuilder<List<PlayersRecord>>(
      stream: queryPlayersRecord(
        queryBuilder: (playersRecord) => playersRecord.where('beingPlayedRef',
            isEqualTo: _model.newBeingPlayedDoc?.reference),
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
        List<PlayersRecord> startPlayersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  context.safePop();
                },
              ),
              title: Text(
                'Start A Game',
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
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              'Your Joining Code Is',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                      textAlign: TextAlign.center,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 20.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.content_copy_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: valueOrDefault<String>(
                                      widget.joinCode,
                                      'IIIII',
                                    )));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Copied to clipboard',
                                          style: GoogleFonts.getFont(
                                            'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                ),
                                Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 20.0,
                                    borderWidth: 2.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.share_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      await Share.share(
                                        'https://moviebingo.page.link/join?${valueOrDefault<String>(
                                          widget.joinCode,
                                          'IIIII',
                                        )}',
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Container(
                                    width: 120.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: BarcodeWidget(
                                        data:
                                            'https://moviebingo.page.link/join?${valueOrDefault<String>(
                                          widget.joinCode,
                                          'IIIII',
                                        )}',
                                        barcode: Barcode.qrCode(),
                                        width: 0.0,
                                        height: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        errorBuilder: (_context, _error) =>
                                            SizedBox(
                                          width: 0.0,
                                          height: 0.0,
                                        ),
                                        drawText: false,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: AutoSizeText(
                                      'Let your friends know the code and when they join they will appear below.',
                                      textAlign: TextAlign.center,
                                      maxLines: 5,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            _model.newBeingPlayedDoc?.reference.id != null &&
                                    _model.newBeingPlayedDoc?.reference.id != ''
                                ? true
                                : false,
                            false,
                          ))
                            Expanded(
                              child: wrapWithModel(
                                model: _model.playersModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: PlayersWidget(
                                  leadPlayerRef: widget.leadPlayerRef!,
                                  beingPlayedRef:
                                      _model.newBeingPlayedDoc!.reference,
                                ),
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: AutoSizeText(
                                    'Click Start when you\'re ready for your game to begin',
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Transform.rotate(
                            angle: 0.0349,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  HapticFeedback.vibrate();

                                  await _model.newBeingPlayedDoc!.reference
                                      .update({
                                    ...createBeingPlayedRecordData(
                                      status: 'Started',
                                    ),
                                    'timeStarted': FieldValue.serverTimestamp(),
                                  });

                                  _model.interstitialAdSuccess =
                                      await admob.showInterstitialAd();

                                  if (_model.interstitialAdSuccess!) {
                                    context.goNamed(
                                      'Game',
                                      queryParameters: {
                                        'beingPlayedRef': serializeParam(
                                          _model.newBeingPlayedDoc?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'cardsDoc': serializeParam(
                                          widget.cardGameRef,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Something went wrong. Please try again.',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'START',
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 24.0,
                                ),
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Neon Glow',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 30.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlutterFlowAdBanner(
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
