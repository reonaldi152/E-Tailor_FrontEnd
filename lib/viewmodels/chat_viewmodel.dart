import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/massage.dart';
import '../services/chat_service.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatService _chatService = ChatService();
  List<MessageModel> _messages = [];
  List<MessageModel> get messages => _messages;

  Stream<List<MessageModel>> listenToMessages(String chatRoomId) {
    return _chatService.getMessages(chatRoomId);
  }

  Future<void> sendMessage(
      String chatRoomId, String sender, String text) async {
    if (text.isEmpty) return;
    MessageModel message = MessageModel(
      sender: sender,
      text: text,
      timestamp: DateTime.now(),
    );
    await _chatService.sendMessage(chatRoomId, message);
  }
}
