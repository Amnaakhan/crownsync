// To parse this JSON data, do
//
//     final inboxModel = inboxModelFromJson(jsonString);

import 'dart:convert';

InboxModel inboxModelFromJson(String str) => InboxModel.fromJson(json.decode(str));

String inboxModelToJson(InboxModel data) => json.encode(data.toJson());

class InboxModel {
  String? status;
  Body? body;

  InboxModel({
    this.status,
    this.body,
  });

  factory InboxModel.fromJson(Map<String, dynamic> json) => InboxModel(
    status: json["status"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "body": body!.toJson(),
  };
}

class Body {
  String? recipientEmail;
  String? senderName;
  String? senderTitle;
  String? senderCompany;
  String? companyDescription;
  String? message;
  String? image;

  Body({
    this.recipientEmail,
    this.senderName,
    this.senderTitle,
    this.senderCompany,
    this.companyDescription,
    this.message,
    this.image,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    recipientEmail: json["recipient_email"],
    senderName: json["sender_name"],
    senderTitle: json["sender_title"],
    senderCompany: json["sender_company"],
    companyDescription: json["company_description"],
    message: json["message"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "recipient_email": recipientEmail,
    "sender_name": senderName,
    "sender_title": senderTitle,
    "sender_company": senderCompany,
    "company_description": companyDescription,
    "message": message,
    "image": image,
  };
}
