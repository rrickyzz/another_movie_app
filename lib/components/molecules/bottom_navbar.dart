import 'package:another_movie_app/components/atoms/navbar_item.dart';
import 'package:another_movie_app/styles/animations/slide.dart';
import 'package:another_movie_app/styles/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double getLeftDistanceByIndex(int index) {
    if (index == 3) {
      return MediaQuery.of(context).size.width * .75;
    }
    if (index == 2) {
      return MediaQuery.of(context).size.width * .51;
    }
    if (index == 1) {
      return MediaQuery.of(context).size.width * .25;
    }

    if (index == 0) {
      return 0;
    }

    return 0;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          color: Colours.secondaryDark,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 90.h,
          child: Stack(
            children: [
              AnimatedPositioned(
                  top: 22.h,
                  left: getLeftDistanceByIndex(_selectedIndex),
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                      width: 64,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colours.redScheme,
                          borderRadius: BorderRadius.circular(12)))),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavItem(
                        active: _selectedIndex == 0,
                        onPressed: () {
                          onTap(0);
                        },
                        assetDir: 'assets/svgs/inactive-home.svg'),
                    NavItem(
                        active: _selectedIndex == 1,
                        onPressed: () {
                          onTap(1);
                        },
                        assetDir: 'assets/svgs/inactive-search.svg'),
                    NavItem(
                        active: _selectedIndex == 2,
                        onPressed: () {
                          onTap(2);
                        },
                        assetDir: 'assets/svgs/inactive-bell.svg'),
                    NavItem(
                        active: _selectedIndex == 3,
                        onPressed: () {
                          onTap(3);
                        },
                        assetDir: 'assets/svgs/inactive-user.svg'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
