import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final bool isPlaying;

  const PlayButton({
    super.key,
    this.isPlaying = false,
  });

  @override
  State<PlayButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PlayButton> {
  late bool isPlaying;
  late Timer opacityAnimTimer;
  double opacity = 1;

  void animateOpacity() {
    opacityAnimTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        opacity = 0;
      });
    });
  }

  void resetAnimationOpacity() {
    setState(() {
      opacity = 1;
    });
  }

  @override
  void initState() {
    isPlaying = widget.isPlaying;
    log('called');
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant PlayButton oldWidget) {
  //   if (isPlaying != oldWidget.isPlaying) {
  //     animateOpacity();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {
    opacity = 1;
    opacityAnimTimer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          resetAnimationOpacity();
          animateOpacity();
          isPlaying = widget.isPlaying;
        },
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: opacity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: isPlaying
                  ? const Icon(
                      Icons.pause,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      color: Colors.amber,
                    ),
            )));
  }
}
