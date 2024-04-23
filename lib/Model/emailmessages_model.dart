// To parse this JSON data, do
//
//     final inboxModel = inboxModelFromJson(jsonString);

import 'dart:convert';

InboxModel inboxModelFromJson(String str) => InboxModel.fromJson(json.decode(str));

String inboxModelToJson(InboxModel data) => json.encode(data.toJson());

class InboxModel {
  List<Datum>? data;

  InboxModel({
    this.data,
  });

  factory InboxModel.fromJson(Map<String, dynamic> json) => InboxModel(
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
  String? body; // Changed to string

  Detail({
    this.snippet,
    this.headers,
    this.body, // Changed to string
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    var bodyString = json["body"]; // Get the string value
    var bodyJson = jsonDecode(bodyString); // Decode the string
    return Detail(
      snippet: bodyJson["snippet"],
      headers: Headers.fromJson(bodyJson["headers"]),
      body: bodyString, // Store the original string
    );
  }

  Map<String, dynamic> toJson() => {
    "snippet": snippet,
    "headers": headers?.toJson(),
    "body": body, // Store the original string
  };
}

class Headers {
  String? deliveredTo;
  String? received;
  String? xGoogleSmtpSource;
  String? xReceived;
  String? arcSeal;
  String? arcMessageSignature;
  String? arcAuthenticationResults;
  String? returnPath;
  String? receivedSpf;
  String? authenticationResults;
  String? freelancerDomainSigner;
  String? dkimSignature;
  String? listUnsubscribe;
  String? subject;
  String? to;
  String? from;
  String? replyTo;
  String? mimeVersion;
  String? contentLanguage;
  String? xPriority;
  String? xAcceptLanguage;
  String? contentType;
  String? date;
  String? messageId;
  String? feedbackId;

  Headers({
    this.deliveredTo,
    this.received,
    this.xGoogleSmtpSource,
    this.xReceived,
    this.arcSeal,
    this.arcMessageSignature,
    this.arcAuthenticationResults,
    this.returnPath,
    this.receivedSpf,
    this.authenticationResults,
    this.freelancerDomainSigner,
    this.dkimSignature,
    this.listUnsubscribe,
    this.subject,
    this.to,
    this.from,
    this.replyTo,
    this.mimeVersion,
    this.contentLanguage,
    this.xPriority,
    this.xAcceptLanguage,
    this.contentType,
    this.date,
    this.messageId,
    this.feedbackId,
  });

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
    deliveredTo: json["Delivered-To"],
    received: json["Received"],
    xGoogleSmtpSource: json["X-Google-Smtp-Source"],
    xReceived: json["X-Received"],
    arcSeal: json["ARC-Seal"],
    arcMessageSignature: json["ARC-Message-Signature"],
    arcAuthenticationResults: json["ARC-Authentication-Results"],
    returnPath: json["Return-Path"],
    receivedSpf: json["Received-SPF"],
    authenticationResults: json["Authentication-Results"],
    freelancerDomainSigner: json["freelancer-domain-signer"],
    dkimSignature: json["DKIM-Signature"],
    listUnsubscribe: json["List-Unsubscribe"],
    subject: json["Subject"],
    to: json["To"],
    from: json["From"],
    replyTo: json["Reply-To"],
    mimeVersion: json["MIME-version"],
    contentLanguage: json["Content-language"],
    xPriority: json["X-Priority"],
    xAcceptLanguage: json["X-Accept-Language"],
    contentType: json["Content-Type"],
    date: json["Date"],
    messageId: json["Message-Id"],
    feedbackId: json["Feedback-ID"],
  );

  Map<String, dynamic> toJson() => {
    "Delivered-To": deliveredTo,
    "Received": received,
    "X-Google-Smtp-Source": xGoogleSmtpSource,
    "X-Received": xReceived,
    "ARC-Seal": arcSeal,
    "ARC-Message-Signature": arcMessageSignature,
    "ARC-Authentication-Results": arcAuthenticationResults,
    "Return-Path": returnPath,
    "Received-SPF": receivedSpf,
    "Authentication-Results": authenticationResults,
    "freelancer-domain-signer": freelancerDomainSigner,
    "DKIM-Signature": dkimSignature,
    "List-Unsubscribe": listUnsubscribe,
    "Subject": subject,
    "To": to,
    "From": from,
    "Reply-To": replyTo,
    "MIME-version": mimeVersion,
    "Content-language": contentLanguage,
    "X-Priority": xPriority,
    "X-Accept-Language": xAcceptLanguage,
    "Content-Type": contentType,
    "Date": date,
    "Message-Id": messageId,
    "Feedback-ID": feedbackId,
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
  dynamic profile;
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
    profile: json["profile"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "email": email,
    "address": address,
    "phone": phone,
    "profile": profile,
    "created_at": createdAt,
  };
}
