import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_bar_model.dart';
export 'progress_bar_model.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({
    Key? key,
    required this.parameter1,
  }) : super(key: key);

  final Color? parameter1;

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  late ProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onExecute.add(StopWatchExecute.start);
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

    return Container(
      width: 150.0,
      height: 36.0,
      child: Stack(
        children: [
          FlutterFlowTimer(
            initialTime: _model.timerMilliseconds,
            getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
              value,
              hours: false,
              minute: false,
              milliSecond: false,
            ),
            timer: _model.timerController,
            updateStateInterval: Duration(milliseconds: 500),
            onChanged: (value, displayTime, shouldUpdate) {
              _model.timerMilliseconds = value;
              _model.timerValue = displayTime;
              if (shouldUpdate) setState(() {});
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
              borderRadius: BorderRadius.circular(12.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: LinearPercentIndicator(
              percent: valueOrDefault<double>(
                (double.tryParse(_model.timerValue) ?? 0) / 15,
                0.0,
              ),
              width: 150.0,
              lineHeight: 36.0,
              animation: false,
              progressColor: Color(0xA323262B),
              backgroundColor: Color(0x98FFFFFF),
              barRadius: Radius.circular(12.0),
              padding: EdgeInsets.zero,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Container(
              width: 38.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.keyboard_voice_rounded,
                color: widget.parameter1,
                size: 20.0,
              ),
            ),
          ),
          Container(
            width: 150.0,
            height: 36.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              _model.timerValue,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
