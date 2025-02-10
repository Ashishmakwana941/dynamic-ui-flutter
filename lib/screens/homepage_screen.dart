import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/homepage_bloc.dart';
import '../theme/global_theme.dart';
import '../widgets/banner_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/product_widget.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          if (state is HomepageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomepageLoaded) {
            final viewtypeList = state.data.viewtypeList;
            final themeColors = state.data.themeColors;
            if (themeColors != null && themeColors.isNotEmpty) {
              GlobalTheme().updateTheme(themeColors);
            }
            return Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GlobalTheme().bgGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView.builder(
                itemCount: viewtypeList?.length ?? 0, // Safe null handling
                itemBuilder: (context, index) {
                  final component =
                      viewtypeList?[index]; // Avoid forcing nullability
                  if (component == null) {
                    return SizedBox.shrink(); // Extra safety
                  }
                  switch (component.viewtype) {
                    case 'Banner':
                      return BannerCarousel(
                          banners: component.data ?? []); // Handle null
                    case 'Category':
                      return CategoryWidget(
                          title: component.title,
                          categories: component.data ?? []); // Handle null
                    case 'Products':
                      return ProductWidget(
                          title: component.title,
                          products: component.data ?? []); // Handle null
                    default:
                      return SizedBox.shrink();
                  }
                },
              ),
            );
          } else if (state is HomepageError) {
            return ErrorMessageWidget(
              message: state.message,
              onRetry: () {
                context
                    .read<HomepageBloc>()
                    .add(FetchHomepageData()); // 🔄 Retry API Call
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
