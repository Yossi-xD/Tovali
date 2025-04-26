import 'package:flutter/material.dart';
import 'provider_dashboard.dart';

class VerifyOTPPageProviderlogin extends StatefulWidget {
  const VerifyOTPPageProviderlogin({super.key});

  @override
  _VerifyOTPPageState createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPageProviderlogin> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOTP() {
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProviderDashboard()),
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
