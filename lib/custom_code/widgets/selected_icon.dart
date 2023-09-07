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

import 'package:like_button/like_button.dart';

class SelectedIcon extends StatefulWidget {
  const SelectedIcon({
    Key? key,
    this.width,
    this.height,
    required this.isSelected,
    this.selectedColor,
    this.unselectedColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  _SelectedIconState createState() => _SelectedIconState();
}

class _SelectedIconState extends State<SelectedIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: LikeButton(
        size: widget.width ?? 30.0,
        likeBuilder: (bool isLiked) {
          return Icon(
            isLiked
                ? Icons.check_circle_outline_rounded
                : Icons.circle_outlined,
            color: isLiked
                ? (widget.selectedColor ??
                    FlutterFlowTheme.of(context).secondary)
                : (widget.unselectedColor ?? Color(0x25666666)),
            size: widget.width ?? 30.0,
          );
        },
        isLiked: widget.isSelected,
      ),
    );
  }
}
