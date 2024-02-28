import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Function onPressed;
  final bool active;
  const CategoryItem(
      {super.key,
      required this.name,
      required this.onPressed,
      this.active = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        onPressed: () => onPressed(),
        child: Text(
          name,
          style: GoogleFonts.inter(
              fontSize: 16,
              color: active ? Colors.white : Colors.grey.shade500,
              fontWeight: active ? FontWeight.w600 : FontWeight.w500),
        ));
  }
}
