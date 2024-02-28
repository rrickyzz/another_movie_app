import 'package:another_movie_app/styles/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTag extends StatelessWidget {
  final String title;
  const MovieTag({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colours.redScheme,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          title,
          style: GoogleFonts.inter(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ));
  }
}

class MovieAnotherTag extends StatelessWidget {
  final String title;
  const MovieAnotherTag({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colours.greyScheme,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Text(
          title,
          style: GoogleFonts.inter(
              color: Colours.lightGrey,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ));
  }
}
