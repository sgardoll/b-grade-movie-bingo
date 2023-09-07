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

class CustomIcon extends StatefulWidget {
  const CustomIcon({
    Key? key,
    this.width,
    this.height,
    this.color,
    required this.iconName,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final String iconName;

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  IconData getIconData(String iconName) {
    // Use this switch statement to map icon names to IconData
    switch (iconName) {
      case 'add':
        return Icons.add;
      case 'home':
        return Icons.home;
      // Add more icons as needed
      default:
        return Icons.error; // Return error icon if no match is found
    }
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = (widget.width ?? 24.0) < (widget.height ?? 24.0)
        ? widget.width ?? 24.0
        : widget.height ?? 24.0; // Use minimum of width and height

    return Icon(
      getIconData(widget.iconName),
      size: iconSize,
      color: widget.color ??
          Colors.black, // Use default color if color is not provided
    );
  }
}
