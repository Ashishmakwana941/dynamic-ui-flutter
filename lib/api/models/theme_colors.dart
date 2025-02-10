class ThemeColors {
  final String? bgClr;
  final String? serviceId;
  final String? txtTitleClr;
  final String? txtClr;
  final String? prdClr;
  final String? catClr;

  ThemeColors({
    this.bgClr,
    this.serviceId,
    this.txtTitleClr,
    this.txtClr,
    this.prdClr,
    this.catClr,
  });

  factory ThemeColors.fromJson(Map<String, dynamic> json) {
    return ThemeColors(
      bgClr: json["bg_clr"],
      serviceId: json["service_id"],
      txtTitleClr: json["txt_title_clr"],
      txtClr: json["txt_clr"],
      prdClr: json["prd_clr"],
      catClr: json["cat_clr"],
    );
  }
}