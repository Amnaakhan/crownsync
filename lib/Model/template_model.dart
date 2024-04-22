// To parse this JSON data, do
//
//     final templateModel = templateModelFromJson(jsonString);

import 'dart:convert';

TemplateModel templateModelFromJson(String str) => TemplateModel.fromJson(json.decode(str));

String templateModelToJson(TemplateModel data) => json.encode(data.toJson());

class TemplateModel {
  List<Datum>? data;

  TemplateModel({
    this.data,
  });

  factory TemplateModel.fromJson(Map<String, dynamic> json) => TemplateModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  dynamic greetings;
  String? heading;
  dynamic footer;
  String? templateName;
  dynamic links;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.greetings,
    this.heading,
    this.footer,
    this.templateName,
    this.links,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    greetings: json["greetings"],
    heading: json["heading"],
    footer: json["footer"],
    templateName: json["template_name"],
    links: json["links"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "greetings": greetings,
    "heading": heading,
    "footer": footer,
    "template_name": templateName,
    "links": links,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
