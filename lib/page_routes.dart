import 'package:flutter/material.dart';

PageRoute createRouteWithoutAnimation(Widget destination) {
  return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => destination,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero);
}

PageRoute createRoute(Widget destination) {
  return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => destination);
}
