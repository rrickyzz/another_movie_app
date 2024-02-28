import 'package:flutter/widgets.dart';

class AppDimensions {
  static EdgeInsets screenScaffoldPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 50);
  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
