class DataModel {
  final bool? isLimit;
  final int? language;
  final bool? isInApp;

  DataModel({this.isLimit = false, this.language = 1,this.isInApp = false});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      isLimit: json['isLimit'],
      language: json['language'],
      isInApp: json['is_in_app'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isLimit'] = isLimit;
    data['language'] = language;
    data['is_in_app'] = isInApp;
    return data;
  }
}
