import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerCarousel extends StatelessWidget {
  final List<dynamic> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20), // Add top margin
        child: CarouselSlider(
          items: banners.map((banner) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // Consistent rounded corners
              child: CachedNetworkImage(
                imageUrl: banner['appbanner_image'],
                fit: BoxFit.fill,
                width: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 150, // Adjust height as needed
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, size: 50),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 150,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}
