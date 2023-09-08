import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_refresh_model.dart';
export 'game_refresh_model.dart';

class GameRefreshWidget extends StatefulWidget {
  const GameRefreshWidget({
    Key? key,
    Color? color,
  })  : this.color = color ?? const Color(0xFF171C28),
        super(key: key);

  final Color color;

  @override
  _GameRefreshWidgetState createState() => _GameRefreshWidgetState();
}

class _GameRefreshWidgetState extends State<GameRefreshWidget> {
  late GameRefreshModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameRefreshModel());

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
      width: 200.0,
      height: 150.0,
      constraints: BoxConstraints(
        maxWidth: 400.0,
      ),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.transparent,
          width: 0.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: Color(0x98FFFFFF),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Icon(
                  Icons.arrow_downward,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: ClipRRect(
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: AutoSizeText(
                        'Swipe Down To Refresh',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).alternate,
                              letterSpacing: 0.2,
                              lineHeight: 1.0,
                            ),
                      ),
                    ),
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
