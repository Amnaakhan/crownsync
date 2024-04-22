// To parse this JSON data, do
//
//     final emailMessagesModel = emailMessagesModelFromJson(jsonString);

import 'dart:convert';

EmailMessagesModel emailMessagesModelFromJson(String str) => EmailMessagesModel.fromJson(json.decode(str));

String emailMessagesModelToJson(EmailMessagesModel data) => json.encode(data.toJson());

class EmailMessagesModel {
  List<Datum>? data;

  EmailMessagesModel({
    this.data,
  });

  factory EmailMessagesModel.fromJson(Map<String, dynamic> json) => EmailMessagesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  LogUser? logUser;
  Detail? detail;

  Datum({
    this.logUser,
    this.detail,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    logUser: LogUser.fromJson(json["log_user"]),
    detail: Detail.fromJson(jsonDecode(json["detail"])),
  );


  Map<String, dynamic> toJson() => {
    "log_user": logUser?.toJson(),
    "detail": detail?.toJson(),
  };
}

class Detail {
  String? snippet;
  Headers? headers;

  Detail({
    this.snippet,
    this.headers,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    snippet: json["snippet"],
    headers: Headers.fromJson(json["headers"]),
  );

  Map<String, dynamic> toJson() => {
    "snippet": snippet,
    "headers": headers?.toJson(),
  };
}

class Headers {
  String? deliveredTo;
  String? received;
  String? xGoogleSmtpSource;
  String? xReceived;
  String? arcSeal;
  String? arcMessageSignature;

  Headers({
    this.deliveredTo,
    this.received,
    this.xGoogleSmtpSource,
    this.xReceived,
    this.arcSeal,
    this.arcMessageSignature,
  });

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
    deliveredTo: json["Delivered-To"],
    received: json["Received"],
    xGoogleSmtpSource: json["X-Google-Smtp-Source"],
    xReceived: json["X-Received"],
    arcSeal: json["ARC-Seal"],
    arcMessageSignature: json["ARC-Message-Signature"],
  );

  Map<String, dynamic> toJson() => {
    "Delivered-To": deliveredTo,
    "Received": received,
    "X-Google-Smtp-Source": xGoogleSmtpSource,
    "X-Received": xReceived,
    "ARC-Seal": arcSeal,
    "ARC-Message-Signature": arcMessageSignature,
  };
}

class LogUser {
  int? id;
  UserId? userId;
  String? provider;
  String? providerId;
  String? providerToken;
  String? contact;

  LogUser({
    this.id,
    this.userId,
    this.provider,
    this.providerId,
    this.providerToken,
    this.contact,
  });

  factory LogUser.fromJson(Map<String, dynamic> json) => LogUser(
    id: json["id"],
    userId: UserId.fromJson(json["user_id"]),
    provider: json["provider"],
    providerId: json["provider_id"],
    providerToken: json["provider_token"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId?.toJson(),
    "provider": provider,
    "provider_id": providerId,
    "provider_token": providerToken,
    "contact": contact,
  };
}

class UserId {
  String? name;
  String? type;
  String? email;
  dynamic address;
  dynamic phone;
  Profile? profile;
  String? createdAt;

  UserId({
    this.name,
    this.type,
    this.email,
    this.address,
    this.phone,
    this.profile,
    this.createdAt,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    name: json["name"],
    type: json["type"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    profile: Profile.fromJson(json["profile"]),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "email": email,
    "address": address,
    "phone": phone,
    "profile": profile?.toJson(),
    "created_at": createdAt,
  };
}

class Profile {
  Profile();

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
  );

  Map<String, dynamic> toJson() => {
  };
}
