import 'package:flutter/material.dart';
import 'verify_otp_Provider_login.dart';

class LoginProviderScreen extends StatefulWidget {
  const LoginProviderScreen({super.key});

  @override
  _LoginProviderScreenState createState() => _LoginProviderScreenState();
}

class _LoginProviderScreenState extends State<LoginProviderScreen> {
  final TextEditingController _phoneController = TextEditingController();

  void _navigateToOTP() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerifyOTPPageProviderlogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login as Provider")),
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
