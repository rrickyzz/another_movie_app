import 'package:flutter/material.dart';

class SlideHorizontalAnim extends StatefulWidget {
  final Widget child;
  final AnimationController controller;
  const SlideHorizontalAnim(
      {super.key, this.child = const SizedBox(), required this.controller});

  @override
  State<SlideHorizontalAnim> createState() => _SlideHorizontalAnimState();
}

class _SlideHorizontalAnimState extends State<SlideHorizontalAnim>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Curves.easeInOut,
      ),
    );

    widget.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: widget.child,
        );
      },
    );
  }
}
