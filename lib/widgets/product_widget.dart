import 'package:dynamic_ui_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../theme/global_theme.dart';

class ProductWidget extends StatelessWidget {
  final String title;
  final List<dynamic> products;

  const ProductWidget({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 5),
            child: Text(
              title,
              style: GlobalTheme.gradientTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                colors: GlobalTheme()
                    .txtTitleGradient, // Must provide a list of colors
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
