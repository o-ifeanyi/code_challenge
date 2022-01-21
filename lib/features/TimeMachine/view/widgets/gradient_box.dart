import 'package:code_challenge/core/util/config.dart';
import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    Key? key,
    required this.title,
    required this.value,
    required this.footnote,
  }) : super(key: key);

  final String title;
  final String value;
  final String footnote;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.yMargin(context, 20),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: Config.xMargin(context, 4)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 1],
          colors: [
            Color(0xFF22C5F3),
            Color(0xFFFEBF82),
            Color(0xFFEF5E52),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: Config.h2(context),
          ),
          Text(
            value,
            style: Config.h1(context),
          ),
          if (footnote.isNotEmpty)
            Text(
              footnote,
              style: Config.b2(context),
            ),
        ],
      ),
    );
  }
}
