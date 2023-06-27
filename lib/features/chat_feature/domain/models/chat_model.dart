import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) =>
    List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  final String senderEmail;
  final String receiverEmail;
  String? message;
  String? imageMessage;
  final String datetime;

  ChatModel({
    required this.senderEmail,
    required this.receiverEmail,
    this.message,
    this.imageMessage,
    required this.datetime,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        senderEmail: json["senderEmail"],
        receiverEmail: json["receiverEmail"],
        message: json["message"],
        imageMessage: json["imageMessage"] ?? "",
        datetime: json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "senderEmail": senderEmail,
        "receiverEmail": receiverEmail,
        "message": message,
        "imageMessage": imageMessage,
        "datetime": datetime,
      };
}
