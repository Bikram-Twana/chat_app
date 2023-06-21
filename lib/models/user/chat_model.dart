// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) =>
    List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  final String email;
  final String sender;
  final String receiver;
  final String message;
  final String datetime;

  ChatModel({
    required this.email,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.datetime,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        email: json["email"],
        sender: json["sender"],
        receiver: json["receiver"],
        message: json["message"],
        datetime: json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "sender": sender,
        "receiver": receiver,
        "message": message,
        "datetime": datetime,
      };
}

// [
//   {
// "email" : "email", 
// "sender" : "sender",
// "receiver" : "receiver",
// "message" : "message",
// "datetime" : "datetime"
// },
// {
// "email" : "email", 
// "sender" : "sender",
// "receiver" : "receiver",
// "message" : "message",
// "datetime" : "datetime"
// }
// ]