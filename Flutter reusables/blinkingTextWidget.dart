import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';

class BlinkingText extends StatefulWidget {
  final String text;
  final double? size;
  Color? color1 = Colors.black;
  Color? color2 = Colors.white;
  BlinkingText(
      {super.key, required this.text, this.size, this.color1, this.color2});

  @override
  State<BlinkingText> createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText> {
  Color? textColor;
  @override
  void initState() {
    super.initState();
    textColor = widget.color1!;

    changeColor.addListener(() {
      if (changeColor.value == true) {
        change(widget.color1, widget.color2);
      } else {
        change(widget.color1, widget.color2);
      }
    });
    setState(() {
      changeColor.value = true;
    });
  }

  change(color1, color2) {
    Timer(Duration(seconds: 5), () {
      if (textColor == color1) {
        setState(() {
          textColor = color2;
          changeColor.value = !changeColor.value;
        });
      } else {
        setState(() {
          textColor = color1;
          changeColor.value = !changeColor.value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.size,
        color: textColor,
      ),
    );
  }
}
