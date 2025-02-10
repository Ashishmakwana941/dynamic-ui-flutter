import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/global_theme.dart';

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizing based on screen width
    double containerWidth = screenWidth * 0.45; // Adjust width dynamically
    double imageHeight = containerWidth * 0.7;  // Maintain aspect ratio
    double textSize = screenWidth * 0.03; // Scale text size
    double priceTextSize = screenWidth * 0.04; // Slightly larger for price
    double iconSize = screenWidth * 0.04; // Adjust icon sizes

    return Container(
      width: containerWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // Responsive margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: GlobalTheme().productGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: product['image'],
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: imageHeight,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: iconSize * 2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['product_name'],
                  style: GlobalTheme.gradientTextStyle(
                    fontSize: priceTextSize,
                    fontWeight: FontWeight.bold,
                    colors: GlobalTheme().txtGradient,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  product['product_des'].replaceAll(RegExp(r'<[^>]*>'), ''),
                  style: GlobalTheme.gradientTextStyle(
                    fontSize: textSize * 0.9,
                    fontWeight: FontWeight.normal,
                    colors: GlobalTheme().txtGradient,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Discounted Price
                    Text(
                      "₹${product['discounted_price']}",
                      style: GlobalTheme.gradientTextStyle(
                        fontSize: priceTextSize,
                        fontWeight: FontWeight.bold,
                        colors: GlobalTheme().txtGradient,
                      ),
                    ),

                    // Show Original Price only if discount > 0
                    if (product['discount'].isNotEmpty &&
                        double.tryParse(product['discount'].replaceAll('%', '')) != null &&
                        double.parse(product['discount'].replaceAll('%', '')) > 0)
                      Text(
                        "₹${product['price']}",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),

                    Spacer(),

                    if (product['discount'].isNotEmpty &&
                        double.tryParse(product['discount'].replaceAll('%', '')) != null &&
                        double.parse(product['discount'].replaceAll('%', '')) > 0)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenWidth * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          product['discount'],
                          style: TextStyle(color: Colors.white, fontSize: textSize),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.01),

                // Rating & Favorite Icon Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: iconSize, color: Colors.amber),
                    SizedBox(width: 5),
                    Text(
                      double.parse(product['rating'].toString()).toStringAsFixed(1),
                      style: GlobalTheme.gradientTextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                        colors: GlobalTheme().txtGradient,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      product['fav_status'] == 1 ? Icons.favorite : Icons.favorite_border,
                      color: product['fav_status'] == 1 ? Colors.red : Colors.grey,
                      size: iconSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
