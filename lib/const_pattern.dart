import 'package:flutter/material.dart';

TextStyle titleStyle(context, size, weight, [spacing = 1.0]) {
  return Theme.of(context).textTheme.overline!.copyWith(
        letterSpacing: spacing,
        fontSize: size,
        fontWeight: weight,
      );
}

TextStyle textStyle(context, opacity, size, weight) {
  return TextStyle(
    color: Theme.of(context).colorScheme.primary.withOpacity(opacity),
    fontSize: size,
    fontWeight: weight,
  );
}

Positioned bottomLinearGradient(BuildContext context) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      height: 80.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor.withOpacity(.05),
            Theme.of(context).scaffoldBackgroundColor.withOpacity(.9),
          ],
        ),
      ),
    ),
  );
}
