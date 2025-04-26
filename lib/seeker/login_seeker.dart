import 'package:flutter/material.dart';
import 'verify_otp_seeker_login.dart';

class LoginSeekerScreen extends StatefulWidget {
  const LoginSeekerScreen({super.key});

  @override
  _LoginSeekerScreenState createState() => _LoginSeekerScreenState();
}

class _LoginSeekerScreenState extends State<LoginSeekerScreen> {
  final TextEditingController _phoneController = TextEditingController();

  void _navigateToOTP() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerifyOTPPageseekerlogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login as Seeker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: _navigateToOTP,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
