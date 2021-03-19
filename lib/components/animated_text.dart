import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration duration;
  AnimatedText(
    this.text, {
    this.style,
    this.duration = const Duration(milliseconds: 500),
    this.textAlign,
  });
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: widget.style.copyWith(
        color: widget.style.color.withOpacity(
          controller.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// class AnimatedText extends StatefulWidget {
//   final Text text;
//   final Duration duration;
//   AnimatedText({this.text, this.duration = const Duration(milliseconds: 500)});
//   @override
//   _AnimatedTextState createState() => _AnimatedTextState();
// }

// class _AnimatedTextState extends State<AnimatedText>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//     controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(widget.text.data,style: widget.text.style)
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
