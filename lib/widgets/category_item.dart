import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/global_theme.dart';

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Responsive Sizing
    double imageSize = screenWidth * 0.18; // Scales with screen width
    double fontSize = screenWidth * 0.03; // Adjusts dynamically

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Responsive Spacing
      child: Column(
        children: [
          // Category Image
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: category['cat_image'],
              fit: BoxFit.cover,
              width: imageSize,
              height: imageSize,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: imageSize * 0.5),
            ),
          ),
          // Category Name
          Text(
            category['cat_name'],
            style: GlobalTheme.gradientTextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              colors: GlobalTheme().txtGradient,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
