// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';

class RandomFlickerText extends StatefulWidget {
  final String text;
  final double width;
  final double height;

  RandomFlickerText({
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  _RandomFlickerTextState createState() => _RandomFlickerTextState();
}

class _RandomFlickerTextState extends State<RandomFlickerText>
    with SingleTickerProviderStateMixin {
  late List<double> opacities;
  final random = Random();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    opacities = List<double>.filled(widget.text.length, 1);
    changeOpacity();
  }

  void changeOpacity() {
    _timer = Timer(Duration(milliseconds: random.nextInt(100)), () {
      if (mounted) {
        setState(() {
          int index = random.nextInt(widget.text.length);
          opacities[index] = opacities[index] == 0 ? 1 : 0;
          changeOpacity();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.text.split('').asMap().entries.map((entry) {
              return AnimatedOpacity(
                opacity: opacities[entry.key],
                duration: Duration(milliseconds: 100),
                child: AutoSizeText(
                  entry.value,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'Neon Glow',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
