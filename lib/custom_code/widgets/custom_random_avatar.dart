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

import 'package:random_avatar/random_avatar.dart';
import 'package:avatar_glow/avatar_glow.dart';

class CustomRandomAvatar extends StatefulWidget {
  final String identifier;
  final double? width;
  final double? height;
  final bool trBackground;
  final Color? glowColor; // Added glowColor parameter

  const CustomRandomAvatar({
    Key? key,
    required this.identifier,
    this.width,
    this.height,
    this.trBackground = false,
    this.glowColor, // Initialize glowColor
  }) : super(key: key);

  @override
  _CustomRandomAvatarState createState() => _CustomRandomAvatarState();
}

class _CustomRandomAvatarState extends State<CustomRandomAvatar> {
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      endRadius: 90.0,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      glowColor: widget.glowColor ??
          Colors
              .blueAccent, // Use the passed glowColor or default to blueAccent
      child: Material(
        elevation: 8.0,
        shape: CircleBorder(),
        child: RandomAvatar(
          widget.identifier,
          width: widget.width,
          height: widget.height,
          trBackground: widget.trBackground,
        ),
      ),
    );
  }
}
