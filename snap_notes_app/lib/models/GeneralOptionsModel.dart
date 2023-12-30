import 'dart:convert';

GeneralOptionsModel generalOptionsModelFromJson(String str) => GeneralOptionsModel.fromJson(json.decode(str));

String generalOptionsModelToJson(GeneralOptionsModel data) => json.encode(data.toJson());

class GeneralOptionsModel {
  String icon;
  String title;

  GeneralOptionsModel({
    required this.icon,
    required this.title,
  });

  factory GeneralOptionsModel.fromJson(Map<String, dynamic> json) => GeneralOptionsModel(
    icon: json["icon"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "title": title,
  };
}
