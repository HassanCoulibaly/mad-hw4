import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  final String boardName;
  const ChatPage({required this.boardName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  void sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;
    final user = FirebaseAuth.instance.currentUser;
    final message = _messageController.text.trim();

    await FirebaseFirestore.instance.collection('messages').add({
      'text': message,
      'datetime': Timestamp.now(),
      'userId': user?.uid,
      'board': widget.boardName,
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.boardName)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('messages')
                      .where('board', isEqualTo: widget.boardName)
                      .orderBy('datetime')
                      .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                final messages = snapshot.data!.docs;
                return ListView(
                  children:
                      messages.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        return ListTile(
                          title: Text(data['text'] ?? ''),
                          subtitle: Text(
                            "${data['datetime'].toDate().toString()} - ${data['userId']}",
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(labelText: 'Type a message'),
                  ),
                ),
                IconButton(onPressed: sendMessage, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
