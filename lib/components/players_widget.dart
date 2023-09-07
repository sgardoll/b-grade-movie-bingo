import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'players_model.dart';
export 'players_model.dart';

class PlayersWidget extends StatefulWidget {
  const PlayersWidget({
    Key? key,
    required this.leadPlayerRef,
    required this.beingPlayedRef,
  }) : super(key: key);

  final DocumentReference? leadPlayerRef;
  final DocumentReference? beingPlayedRef;

  @override
  _PlayersWidgetState createState() => _PlayersWidgetState();
}

class _PlayersWidgetState extends State<PlayersWidget> {
  late PlayersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayersModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: StreamBuilder<List<PlayersRecord>>(
            stream: queryPlayersRecord(
              queryBuilder: (playersRecord) => playersRecord
                  .where('beingPlayedRef', isEqualTo: widget.beingPlayedRef)
                  .where('playerName', isNotEqualTo: widget.leadPlayerRef?.id),
            ),
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
              List<PlayersRecord> staggeredViewPlayersRecordList =
                  snapshot.data!;
              return MasonryGridView.count(
                crossAxisCount: valueOrDefault<int>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 2;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 3;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 4;
                    } else {
                      return 2;
                    }
                  }(),
                  2,
                ),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                itemCount: staggeredViewPlayersRecordList.length,
                shrinkWrap: true,
                itemBuilder: (context, staggeredViewIndex) {
                  final staggeredViewPlayersRecord =
                      staggeredViewPlayersRecordList[staggeredViewIndex];
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                child: custom_widgets.CustomRandomAvatar(
                                  width: 60.0,
                                  height: 60.0,
                                  identifier:
                                      staggeredViewPlayersRecord.reference.id,
                                  trBackground: true,
                                  glowColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  staggeredViewPlayersRecord.playerName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF14181B),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                staggeredViewPlayersRecord.reference ==
                                        widget.leadPlayerRef
                                    ? true
                                    : false,
                                false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Game Lead',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
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
  }
}
