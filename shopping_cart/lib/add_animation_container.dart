import 'package:flutter/material.dart';

import 'add_animation_item.dart';

class AddAnimationContainer extends StatefulWidget {
  final Offset startOffset, endOffset;
  final Size size;
  final double topHeight;

  const AddAnimationContainer(
      {Key key,
      this.startOffset,
      this.size,
      this.endOffset,
      this.topHeight = 0})
      : super(key: key);

  @override
  _AddAnimationContainerState createState() => _AddAnimationContainerState();
}

class _AddAnimationContainerState extends State<AddAnimationContainer> {
  List<Widget> childrens = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AddAnimationContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startOffset != null) {
      childrens.add(
        AddAnimationItemView(
          startOffset: widget.startOffset,
          endOffset: widget.endOffset,
          topHeight: widget.topHeight,
          onEnd: (v) {
            print("动画结束： ${childrens.length}");
            childrens.remove(v);
            print("remove结束： ${childrens.length}");
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: childrens,
    );
  }
}
