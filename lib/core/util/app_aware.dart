import 'package:code_challenge/core/services/snackbar_service.dart';
import 'package:code_challenge/features/TimeMachine/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class AppAware extends StatefulWidget {
  final Widget child;

  const AppAware({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _AppAwareState createState() => _AppAwareState();
}

class _AppAwareState extends State<AppAware> {
  OverlaySupportEntry? _snackBarEntry;
  late SnackBarService _snackBarService;
  @override
  void initState() {
    _snackBarService = SnackBarService();
    _snackBarService.stream.listen((event) {
      _snackBarEntry?.dismiss();
      _snackBarEntry = showOverlayNotification(
        (context) {
          return CustomSnackBar(event);
        },
        position: event.position,
        duration: event.duration,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: widget.child,
    );
  }
}
