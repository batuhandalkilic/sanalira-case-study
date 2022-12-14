// To parse this JSON data, do
//
//     final banks = banksFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Banks banksFromJson(String str) => Banks.fromJson(json.decode(str));

String banksToJson(Banks data) => json.encode(data.toJson());

class Banks {
  Banks({
    this.bankName,
    this.bankIban,
    this.bankAccountName,
    this.descriptionNo,
  });

  String? bankName;
  String? bankIban;
  String? bankAccountName;
  String? descriptionNo;

  factory Banks.fromJson(Map<String, dynamic> json) => Banks(
        bankName: json["bankName"] == null ? null : json["bankName"],
        bankIban: json["bankIban"] == null ? null : json["bankIban"],
        bankAccountName: json["bankAccountName"] == null ? null : json["bankAccountName"],
        descriptionNo: json["descriptionNo"] == null ? null : json["descriptionNo"],
      );

  Map<String, dynamic> toJson() => {
        "bankName": bankName == null ? null : bankName,
        "bankIban": bankIban == null ? null : bankIban,
        "bankAccountName": bankAccountName == null ? null : bankAccountName,
        "descriptionNo": descriptionNo == null ? null : descriptionNo,
      };
}
