// To parse this JSON data, do
//
//     final modeldata = modeldataFromJson(jsonString);

import 'dart:convert';

Modeldata modeldataFromJson(String str) => Modeldata.fromJson(json.decode(str));

String modeldataToJson(Modeldata data) => json.encode(data.toJson());

class Modeldata {
  List<Datum>? data;

  Modeldata({
    this.data,
  });

  factory Modeldata.fromJson(Map<String, dynamic> json) => Modeldata(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? collectionId;
  String? collectionName;
  String? name;
  String? slug;
  int? price;
  String? stock;
  String? image;
  String? features;
  String? link;
  String? benefits;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.collectionId,
    this.collectionName,
    this.name,
    this.slug,
    this.price,
    this.stock,
    this.image,
    this.features,
    this.link,
    this.benefits,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    collectionId: json["collection_id"],
    collectionName: json["collection_name"],
    name: json["name"],
    slug: json["slug"],
    price: json["price"],
    stock: json["stock"],
    image: json["image"],
    features: json["features"],
    link: json["link"],
    benefits: json["benefits"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "collection_id": collectionId,
    "collection_name": collectionName,
    "name": name,
    "slug": slug,
    "price": price,
    "stock": stock,
    "image": image,
    "features": features,
    "link": link,
    "benefits": benefits,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
