import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String boardName;
  const ChatPage({required this.boardName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(boardName)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(title: Text("[12:34] Alice: Hello everyone!")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Type a message'),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
