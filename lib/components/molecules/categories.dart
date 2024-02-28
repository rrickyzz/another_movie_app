import 'package:another_movie_app/components/atoms/category_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Row(
          children: [
            CategoryItem(
              name: 'All',
              onPressed: () {},
              active: true,
            ),
            CategoryItem(name: 'Movies', onPressed: () {}),
            CategoryItem(name: 'Anime', onPressed: () {}),
            CategoryItem(name: 'Series', onPressed: () {}),
            CategoryItem(name: 'Tv Shows', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
