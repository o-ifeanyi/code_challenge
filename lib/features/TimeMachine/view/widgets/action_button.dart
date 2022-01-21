import 'package:code_challenge/core/util/config.dart';
import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    required Widget child,
    required Color color,
    double radius = 30,
  })  : _child = child,
        _radius = radius,
        _color = color;

  final Widget _child;
  final Color _color;
  final double _radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.yMargin(context, 7.5),
      width: Config.xMargin(context, 50),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        color: _color,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: _child,
    );
  }
}
