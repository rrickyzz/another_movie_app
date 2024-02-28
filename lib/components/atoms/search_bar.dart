import 'package:another_movie_app/styles/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSearchBar extends StatelessWidget {
  final String placeHolder;
  final TextEditingController controller;
  const MovieSearchBar(
      {super.key, required this.placeHolder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: CupertinoTextField(
        placeholder: placeHolder,
        prefix: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(
            'assets/svgs/inactive-search.svg',
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        placeholderStyle:
            GoogleFonts.inter(fontSize: 16, color: Colours.lightGrey),
        style: GoogleFonts.inter(fontSize: 16, color: Colours.lightGrey),
        decoration: BoxDecoration(
            color: Colours.greyScheme, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
