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

  RandomFlickerText(
      {required this.text, required this.width, required this.height});

  @override
  _RandomFlickerTextState createState() => _RandomFlickerTextState();
}

class _RandomFlickerTextState extends State<RandomFlickerText>
    with SingleTickerProviderStateMixin {
  late List<double> opacities;
  final random = Random();
  Timer? _timer; // Declare the timer variable

  @override
  void initState() {
    super.initState();
    opacities = List<double>.filled(widget.text.length, 1);
    changeOpacity();
  }

  void changeOpacity() {
    _timer = Timer(Duration(milliseconds: random.nextInt(1000)), () {
      if (mounted) {
        // Check if the widget is still in the tree
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
    _timer?.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the text
            children: widget.text.split('').asMap().entries.map((entry) {
              return AnimatedOpacity(
                opacity: opacities[entry.key],
                duration: Duration(milliseconds: 500),
                child: AutoSizeText(
                  entry.value,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Neon Glow',
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
