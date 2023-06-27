// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: (isMe) ? Colors.blue[300] : Colors.grey[200]),
      child: Text(
        message,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
