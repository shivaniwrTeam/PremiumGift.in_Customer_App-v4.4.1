import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredRouter extends PageRoute<void> {
  final double? sigmaX;
  final double? sigmaY;
  final bool? barrierDismiss;
  BlurredRouter(
      {required this.builder,
      this.barrierDismiss,
      super.settings,
      this.sigmaX,
      this.sigmaY,})
      : super(fullscreenDialog: false);
  final WidgetBuilder builder;
  @override
  bool get opaque => false;
  @override
  Color get barrierColor => Colors.transparent;
  @override
  bool get barrierDismissible => barrierDismiss ?? super.barrierDismissible;
  @override
  String get barrierLabel => "blurred";
  @override
  bool get maintainState => true;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation,) {
    final result = builder(context);
    if (Platform.isIOS) {
      final theme = Theme.of(context).pageTransitionsTheme;
      return theme.buildTransitions(
        this,
        context,
        animation,
        Animation.fromValueListenable(ValueNotifier(0)),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigmaX ?? 5,
            sigmaY: sigmaY ?? 10,
          ),
          child: result,
        ),
      );
    }
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX ?? 5,
          sigmaY: sigmaY ?? 10,
        ),
        child: result,
      ),
    );
  }
}
