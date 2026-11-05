import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget symtricpadding({double vertical = 0.0, double hrozintal = 0.0}) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: hrozintal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget onlyPadding({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
    );
  }

  Widget allPadding({double value = 0.0}) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }
}
