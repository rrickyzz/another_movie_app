import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavItem extends StatefulWidget {
  final bool active;
  final Function onPressed;
  final String assetDir;

  const NavItem({
    Key? key,
    required this.onPressed,
    required this.assetDir,
    this.active = false,
  }) : super(key: key);

  @override
  NavItemState createState() => NavItemState();
}

class NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          surfaceTintColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () => widget.onPressed(),
      child: SvgPicture.asset(
        widget.assetDir,
        width: 25,
        height: 25,
        colorFilter: widget.active
            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : ColorFilter.mode(Colors.grey.shade600, BlendMode.srcIn),
      ),
    );
  }
}
