// To parse this JSON data, do
//
//     final getSentMailsModel = getSentMailsModelFromJson(jsonString);

import 'dart:convert';

GetSentMailsModel getSentMailsModelFromJson(String str) => GetSentMailsModel.fromJson(json.decode(str));

String getSentMailsModelToJson(GetSentMailsModel data) => json.encode(data.toJson());

class GetSentMailsModel {
  List<Datum>? data;

  GetSentMailsModel({
    this.data,
  });

  factory GetSentMailsModel.fromJson(Map<String, dynamic> json) => GetSentMailsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? senderEmail;
  String? recipientEmail;
  String? subject;
  String? message;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? receivedMessage;
  int? userId;

  Datum({
    this.id,
    this.senderEmail,
    this.recipientEmail,
    this.subject,
    this.message,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.receivedMessage,
    this.userId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    senderEmail: json["sender_email"],
    recipientEmail: json["recipient_email"],
    subject: json["subject"],
    message: json["message"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    receivedMessage: json["received_message"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_email": senderEmail,
    "recipient_email": recipientEmail,
    "subject": subject,
    "message": message,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "received_message": receivedMessage,
    "user_id": userId,
  };
}
