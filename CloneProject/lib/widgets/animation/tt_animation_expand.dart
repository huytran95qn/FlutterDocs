import 'package:flutter/material.dart';

class TTAnimationExpand extends StatefulWidget {
  final Widget child;
  final double width;
  final bool hasExpand;
  final Function onPress;

  const TTAnimationExpand({Key key, @required this.child, this.width, this.hasExpand = false, this.onPress}) : super(key: key);
  @override
  _TTAnimationExpandState createState() => _TTAnimationExpandState();
}

class _TTAnimationExpandState extends State<TTAnimationExpand> with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    _prepareAnimations();
    super.initState();
  }
  
  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    toogleFilterExpand();
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 1.0,
      child: Container(
        width: widget.width,
        color: Colors.white,
        child: widget.child,
      ),
    );
  }

  void _prepareAnimations() {
    expandController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      }
    );
  }

  void toogleFilterExpand() {
    if (widget.hasExpand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }
}
