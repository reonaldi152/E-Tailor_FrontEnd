import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      chatService.sendMessage(messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['text']),
                      subtitle: Text(doc['senderName']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: messageController),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
