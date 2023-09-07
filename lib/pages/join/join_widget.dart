import '/backend/backend.dart';
import '/components/start_enter_name_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'join_model.dart';
export 'join_model.dart';

class JoinWidget extends StatefulWidget {
  const JoinWidget({
    Key? key,
    String? joinCode,
  })  : this.joinCode = joinCode ?? 'IIIII',
        super(key: key);

  final String joinCode;

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  late JoinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JoinModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.joinCode = widget.joinCode;
      });
    });

    _model.textFieldJoinCodeController ??= TextEditingController(
        text: _model.joinCode == 'IIIII' ? '' : widget.joinCode);
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
            'Join A Game',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Enter your 5 digit join code below',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldJoinCodeController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldJoinCodeController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  textInputAction: TextInputAction.go,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '5 digit join code',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    suffixIcon: _model
                                            .textFieldJoinCodeController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textFieldJoinCodeController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldJoinCodeControllerValidator
                                      .asValidator(context),
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
                                  Icons.qr_code_scanner_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  _model.qrScanOutput =
                                      await FlutterBarcodeScanner.scanBarcode(
                                    '#C62828', // scanning line color
                                    'Cancel', // cancel button text
                                    true, // whether to show the flash icon
                                    ScanMode.QR,
                                  );

                                  setState(() {
                                    _model.joinCode = _model.qrScanOutput;
                                  });

                                  setState(() {});
                                },
                              ),
                            ]
                                .divide(SizedBox(width: 16.0))
                                .around(SizedBox(width: 16.0)),
                          ),
                        ),
                        Transform.rotate(
                          angle: 6.1785,
                          child: Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                _model.findBeingPlayed2 =
                                    await queryBeingPlayedRecordOnce(
                                  queryBuilder: (beingPlayedRecord) =>
                                      beingPlayedRecord.where('joinCode',
                                          isEqualTo: _model
                                              .textFieldJoinCodeController
                                              .text),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.findBeingPlayed2!.hasJoinCode()) {
                                  var playersRecordReference =
                                      PlayersRecord.collection.doc();
                                  await playersRecordReference
                                      .set(createPlayersRecordData());
                                  _model.newPlayerRefJoin =
                                      PlayersRecord.getDocumentFromData(
                                          createPlayersRecordData(),
                                          playersRecordReference);
                                  setState(() {
                                    FFAppState().playerRef =
                                        _model.newPlayerRefJoin?.reference;
                                  });
                                  await showAlignedDialog(
                                    barrierColor: Color(0xC0000000),
                                    barrierDismissible: false,
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: true,
                                    targetAnchor: AlignmentDirectional(
                                            0.0, -1.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, -1.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode),
                                          child: StartEnterNameWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(
                                      () => _model.leadPlayerNameJoin = value));

                                  await _model.findBeingPlayed2!.reference
                                      .update({
                                    'players': FieldValue.arrayUnion(
                                        [_model.newPlayerRefJoin?.reference]),
                                  });
                                  if (_model.leadPlayerNameJoin != null &&
                                      _model.leadPlayerNameJoin != '') {
                                    await _model.newPlayerRefJoin!.reference
                                        .update(createPlayersRecordData(
                                      playerName: _model.leadPlayerNameJoin,
                                      beingPlayedRef:
                                          _model.findBeingPlayed2?.reference,
                                    ));

                                    context.pushNamed(
                                      'Waiting',
                                      queryParameters: {
                                        'playerRef': serializeParam(
                                          FFAppState().playerRef,
                                          ParamType.DocumentReference,
                                        ),
                                        'beingPlayedDoc': serializeParam(
                                          _model.findBeingPlayed2,
                                          ParamType.Document,
                                        ),
                                        'cardGameRef': serializeParam(
                                          _model.findBeingPlayed2?.cards,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'beingPlayedDoc':
                                            _model.findBeingPlayed2,
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Nothing was entered',
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
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Join Code Looks To Be Incorrect. Please Try Again',
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
                              text: 'JOIN',
                              icon: Icon(
                                Icons.group_add_sharp,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
    );
  }
}
