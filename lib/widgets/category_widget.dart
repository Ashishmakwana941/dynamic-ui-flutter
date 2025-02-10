import 'package:flutter/material.dart';

import '../theme/global_theme.dart';
import 'category_item.dart';

class CategoryWidget extends StatelessWidget {
  final List<dynamic> categories;
  final String title;

  const CategoryWidget(
      {super.key, required this.title, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 5),
            child: Text(
              title,
              style: GlobalTheme.gradientTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                colors: GlobalTheme().txtTitleGradient,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(category: categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
