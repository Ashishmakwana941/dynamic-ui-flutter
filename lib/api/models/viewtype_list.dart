class ViewtypeList {
  final String? viewtype;
  final String? datatype;
  final String title;
  final String? designtype;
  final List<dynamic>? data;

  ViewtypeList({
    this.viewtype,
    this.datatype,
    required this.title,
    this.designtype,
    this.data,
  });

  factory ViewtypeList.fromJson(Map<String, dynamic> json) {
    return ViewtypeList(
      viewtype: json["viewtype"],
      datatype: json["datatype"],
      title: json["title"],
      designtype: json["designtype"],
      data: json["data"] != null
          ? List<dynamic>.from(json["data"].map((x) => x))
          : null, // Handle null
    );
  }
}
