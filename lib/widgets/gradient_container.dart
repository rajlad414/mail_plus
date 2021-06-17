import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  Widget w;

  GradientContainer(this.w);

  @override
  _GradientContainerState createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color(0xFF000000),
                const Color(0xFFFFFFFF),
              ],
              begin: const FractionalOffset(0.0, 1.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: widget.w,
    );
  }
}
