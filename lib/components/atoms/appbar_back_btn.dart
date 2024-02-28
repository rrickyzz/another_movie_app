import 'package:another_movie_app/styles/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colours.greyScheme, shape: BoxShape.circle),
      width: 48,
      height: 48,
      child: Center(
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
