import 'package:flutter/material.dart';

import 'design_size.dart';

extension BuildContextX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double? get iconSize => IconTheme.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double responsive(double size, {Axis axis = Axis.vertical}) {
    final currentSize =
        axis == Axis.horizontal ? screenSize.width : screenSize.height;
    final designSize = axis == Axis.horizontal
        ? designScreenSize.width
        : designScreenSize.height;
    return size * currentSize / designSize;
  }

  double scaledResponsive(double size, Size scaledSize, zoom,
      {Axis axis = Axis.vertical}) {
    final currentSize =
        axis == Axis.horizontal ? scaledSize.width : scaledSize.height;
    final designSize = axis == Axis.horizontal
        ? designScreenSize.width
        : designScreenSize.height;
    return zoom * size * currentSize / designSize;
  }
}

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getTextWidth(String text, TextStyle style) {
  TextPainter textPainter = TextPainter()
    ..text = TextSpan(text: text, style: style)
    ..textDirection = TextDirection.ltr
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size.width;
}

List testImages = [
  "assets/images/1.jpeg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
  "assets/images/4.jpg",
  "assets/images/5.jpg"
];

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}