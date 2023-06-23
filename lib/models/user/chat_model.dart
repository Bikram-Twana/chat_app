// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) =>
    List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  final String senderEmail;
  final String receiverEmail;
  String? message;
  String? image;
  final String datetime;

  ChatModel({
    required this.senderEmail,
    required this.receiverEmail,
    this.message,
    this.image,
    required this.datetime,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        senderEmail: json["senderEmail"],
        receiverEmail: json["receiverEmail"],
        message: json["message"],
        image: json["image"],
        datetime: json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "senderEmail": senderEmail,
        "receiverEmail": receiverEmail,
        "message": message,
        "image": image,
        "datetime": datetime,
      };
}
