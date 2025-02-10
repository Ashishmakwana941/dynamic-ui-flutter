import 'dart:convert';

import 'package:dynamic_ui_app/api/models/theme_colors.dart';
import 'package:dynamic_ui_app/api/models/viewtype_list.dart';

HomepageResponse homepageResponseFromJson(String str) =>
    HomepageResponse.fromJson(json.decode(str));

class HomepageResponse {
  final List<ViewtypeList>? viewtypeList;
  final List<ThemeColors>? themeColors;
  final String? status;
  final int? statusCode;
  final String? message;
  final String? type;

  HomepageResponse({
    this.viewtypeList,
    this.themeColors,
    this.status,
    this.statusCode,
    this.message,
    this.type,
  });

  factory HomepageResponse.fromJson(Map<String, dynamic> json) {
    return HomepageResponse(
      viewtypeList: json["ViewtypeList"] != null
          ? List<ViewtypeList>.from(
          json["ViewtypeList"].map((x) => ViewtypeList.fromJson(x)))
          : null, // Handle null
      themeColors: json["theme_colors"] != null
          ? List<ThemeColors>.from(
          json["theme_colors"].map((x) => ThemeColors.fromJson(x)))
          : null, // Handle null
      status: json["status"],
      statusCode: json["statusCode"],
      message: json["message"],
      type: json["type"],
    );
  }
}