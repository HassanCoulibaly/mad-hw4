import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Date of Birth')),
            ElevatedButton(onPressed: () {}, child: Text("Change Password")),
            ElevatedButton(onPressed: () {}, child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
