import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(dynamicHeight(0.01));
  EdgeInsets get paddingMedium => EdgeInsets.all(dynamicHeight(0.02));

  EdgeInsets get paddingHigh => EdgeInsets.all(dynamicHeight(0.03));
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicWidth(0.02));
  EdgeInsets get paddingHorizontalHigh =>
      EdgeInsets.symmetric(horizontal: dynamicWidth(0.2));
  EdgeInsets get paddingHorizontalMedium =>
      EdgeInsets.symmetric(horizontal: dynamicWidth(0.1));
  EdgeInsets get paddingVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.02));
}
