import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> boards = [
    {"name": "General", "icon": Icons.chat},
    {"name": "Games", "icon": Icons.videogame_asset},
    {"name": "Business", "icon": Icons.business},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Message Boards")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Menu"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Message Boards"),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];
          return ListTile(
            leading: Icon(board["icon"]),
            title: Text(board["name"]),
            onTap:
                () => Navigator.pushNamed(
                  context,
                  '/chat',
                  arguments: board["name"],
                ),
          );
        },
      ),
    );
  }
}
