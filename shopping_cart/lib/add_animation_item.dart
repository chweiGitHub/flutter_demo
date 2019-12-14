import 'dart:math';

import 'package:flutter/material.dart';

class AddAnimationItemView extends StatefulWidget {
  final Offset startOffset, endOffset;
  final Function onEnd;
  final double topHeight;

  const AddAnimationItemView(
      {Key key, this.startOffset, this.endOffset, this.onEnd, this.topHeight=0})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AddAnimationItemView>
    with SingleTickerProviderStateMixin {
  double top = 0;
  double left = 0;

  AnimationController _controller;

  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _animation = Tween(begin: 0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (widget.onEnd != null) {
            widget.onEnd(this.widget);
          }
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animation = null;
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1. about start
    var startX = widget.startOffset.dx;
    var startY = widget.startOffset.dy;

    // 2. about end
    var endX = widget.endOffset.dx;
    var endY = widget.endOffset.dy;

    // 3. calculate
    var x = startX + (endX - startX) * _animation.value;
    var y = startY + (endY - startY) * _animation.value;

    top = y;
    left = x;

    return Container(
      child: Positioned(
        top: top  - widget.topHeight,
        left: left,
        child: Icon(
          Icons.arrow_drop_down_circle,
          color: Colors.red,
          size: 18,
        ),
      ),
    );
  }
}
