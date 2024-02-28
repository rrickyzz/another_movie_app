import 'package:flutter/material.dart';

class TransparentAppBar extends AppBar {
  final Widget? leading;
  final List<Widget>? actions;

  // Constructor to pass additional parameters to the super constructor
  TransparentAppBar({Key? key, Widget? title, this.leading, this.actions})
      : super(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.transparent,
          leading: leading,
          key: key,
          title: title, // You can customize the title here
          actions: actions,
          // You can add more properties or customize existing ones here
        );
}
