import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  void resetPassword(BuildContext context) async {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Password reset email sent!")));
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    _emailController.text = user?.email ?? '';

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () => resetPassword(context),
              child: Text("Change Password"),
            ),
            ElevatedButton(
              onPressed: () => logout(context),
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
