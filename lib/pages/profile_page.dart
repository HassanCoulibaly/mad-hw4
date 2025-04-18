import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'First Name')),
            TextField(decoration: InputDecoration(labelText: 'Last Name')),
            TextField(decoration: InputDecoration(labelText: 'Role')),
            ElevatedButton(onPressed: () {}, child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
