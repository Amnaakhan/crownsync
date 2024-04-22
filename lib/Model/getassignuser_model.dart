// To parse this JSON data, do
//
//     final getAssignUserModel = getAssignUserModelFromJson(jsonString);

import 'dart:convert';

GetAssignUserModel getAssignUserModelFromJson(String str) => GetAssignUserModel.fromJson(json.decode(str));

String getAssignUserModelToJson(GetAssignUserModel data) => json.encode(data.toJson());

class GetAssignUserModel {
  List<Datum>? data;

  GetAssignUserModel({
    this.data,
  });

  factory GetAssignUserModel.fromJson(Map<String, dynamic> json) => GetAssignUserModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int ?id;
  String? teamId;
  String? messageId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.teamId,
    this.messageId,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    teamId: json["team_id"],
    messageId: json["message_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_id": teamId,
    "message_id": messageId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
