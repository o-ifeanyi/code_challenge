import 'package:code_challenge/core/services/snackbar_service.dart';
import 'package:code_challenge/core/util/config.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final SnackbarModel snackbarModel;

  const CustomSnackBar(this.snackbarModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.all(
            Config.xMargin(context, 5),
          ),
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: snackbarModel.isError
                ? Theme.of(context).errorColor
                : Theme.of(context).colorScheme.secondary,
          ),
          child: Text(
            snackbarModel.message,
            style: Config.b1(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
