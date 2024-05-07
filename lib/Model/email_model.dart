// To parse this JSON data, do
//
//     final emailModel = emailModelFromJson(jsonString);

import 'dart:convert';

EmailModel emailModelFromJson(String str) => EmailModel.fromJson(json.decode(str));

String emailModelToJson(EmailModel data) => json.encode(data.toJson());

class EmailModel {
  String status;
  Body body;

  EmailModel({
    required this.status,
    required this.body,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
    status: json["status"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "body": body.toJson(),
  };
}

class Body {
  String recipientEmail;
  String senderName;
  String senderTitle;
  String senderCompany;
  String companyDescription;
  String message;
  String image;

  Body({
    required this.recipientEmail,
    required this.senderName,
    required this.senderTitle,
    required this.senderCompany,
    required this.companyDescription,
    required this.message,
    required this.image,
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
