import 'package:flutter/material.dart';
class AppCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color backgroundColor;
  final double borderRadius;
  final double height;
  final double width;
  final double padding;

  AppCard({
    Key key,
    this.width,
    this.height,
    this.child,
    this.color,
    this.backgroundColor = Colors.white,
    this.borderRadius = 5,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 16),
        child: child,
      ),
    );
  }
}
