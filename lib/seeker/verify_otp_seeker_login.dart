import 'package:flutter/material.dart';
import 'seeker_dashboard.dart';

class VerifyOTPPageseekerlogin extends StatefulWidget {
  const VerifyOTPPageseekerlogin({super.key});

  @override
  _VerifyOTPPageState createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPageseekerlogin> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOTP() {
    // Add OTP verification logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeekerDashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
