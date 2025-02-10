import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/models/theme_colors.dart';

class GlobalTheme {
  static final GlobalTheme _instance = GlobalTheme._internal();

  factory GlobalTheme() => _instance;

  GlobalTheme._internal();

  /// **Global Theme Colors (Stored as Gradient Lists)**
  List<Color> bgGradient = [Colors.white, Colors.black];
  List<Color> txtTitleGradient = [Colors.black, Colors.black];
  List<Color> txtGradient = [Colors.black, Colors.black];
  List<Color> productGradient = [Colors.grey, Colors.grey];
  List<Color> categoryGradient = [Colors.grey, Colors.grey];

  /// **Update Theme Based on `service_id`**
  void updateTheme(List<ThemeColors>? themeColors) {
    if (themeColors == null || themeColors.isEmpty) return;

    // Find the matching theme for the given service ID
    ThemeColors? selectedTheme = themeColors.firstWhere(
        (theme) => theme.serviceId == ApiService.serviceId,
        orElse: () => themeColors.first);

    bgGradient = _parseGradient(selectedTheme.bgClr, ['#FFFFFF', '#000000']);
    txtTitleGradient =
        _parseGradient(selectedTheme.txtTitleClr, ['#000000', '#000000']);
    txtGradient = _parseGradient(selectedTheme.txtClr, ['#000000', '#000000']);
    productGradient =
        _parseGradient(selectedTheme.prdClr, ['#CCCCCC', '#CCCCCC']);
    categoryGradient =
        _parseGradient(selectedTheme.catClr, ['#CCCCCC', '#CCCCCC']);
  }

  /// **Convert Hex String to Color List**
  List<Color> _parseGradient(String? hexString, List<String> defaultColors) {
    List<String> hexList = (hexString ?? defaultColors.join(',')).split(',');
    return hexList.map((hex) => _parseColor(hex.trim())).toList();
  }

  /// **Convert Hex to Flutter Color**
  Color _parseColor(String hexCode) {
    hexCode = hexCode.replaceAll("#", "");
    return Color(int.parse("0xFF$hexCode"));
  }

  /// Global Gradient TextStyle
  static TextStyle gradientTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required List<Color> colors,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      foreground: Paint()
        ..shader = LinearGradient(
          colors: colors,
        ).createShader(Rect.fromLTWH(0, 0, 200, 50)), // Adjust as needed
    );
  }
}
