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
  SenderEmail ?senderEmail;
  String ?recipientEmail;
  Subject? subject;
  String? message;
  Status ?status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String ?receivedMessage;

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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    senderEmail: senderEmailValues.map[json["sender_email"]],
    recipientEmail: json["recipient_email"],
    subject: subjectValues.map[json["subject"]],
    message: json["message"],
    status: statusValues.map[json["status"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    receivedMessage: json["received_message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_email": senderEmailValues.reverse[senderEmail],
    "recipient_email": recipientEmail,
    "subject": subjectValues.reverse[subject],
    "message": message,
    "status": statusValues.reverse[status],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "received_message": receivedMessage,
  };
}

enum SenderEmail {
  MZUBAIRKHAN_OFFICIAL_GMAIL_COM,
  THEZUBAIRKHAN_DEVELOPER_GMAIL_COM
}

final senderEmailValues = EnumValues({
  "mzubairkhan.official@gmail.com": SenderEmail.MZUBAIRKHAN_OFFICIAL_GMAIL_COM,
  "thezubairkhan.developer@gmail.com": SenderEmail.THEZUBAIRKHAN_DEVELOPER_GMAIL_COM
});

enum Status {
  SENT
}

final statusValues = EnumValues({
  "sent": Status.SENT
});

enum Subject {
  THIS_FROM_TEXT,
  THIS_MAIL_FROM_CROWN_SYNC_AI
}

final subjectValues = EnumValues({
  "This from Text": Subject.THIS_FROM_TEXT,
  "This mail from CrownSyncAI": Subject.THIS_MAIL_FROM_CROWN_SYNC_AI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
