import 'package:flutter/material.dart';
// Navigate to the success screen after OTP verification
import 'identity_verification_screen.dart';

class VerifyOTPPagesignup extends StatefulWidget {
  const VerifyOTPPagesignup({super.key});

  @override
  _VerifyOTPPageState createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPagesignup> {
  final _otpController = TextEditingController();

  // Function to handle OTP verification
  void _verifyOTP() {
    if (_otpController.text.length == 4) {
      // Navigate to the success screen once OTP is verified
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IdentityVerificationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('הכנס קוד OTP תקין')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('אימות קוד OTP', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // Right-to-left for Hebrew
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Title
              Text(
                'הכנס את קוד ה-OTP שנשלח אליך',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // OTP TextField
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'הכנס קוד OTP',
                  hintText: '0000',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Verify Button
              ElevatedButton(
                onPressed: _verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('אמת את הקוד', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(height: 20),

              // Resend OTP Link
Center(
  child: GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('הקוד נשלח מחדש')),
      );
    },
    child: Text(
      'לא קיבלת את הקוד? שלח שוב',
      style: TextStyle(
        color: Colors.blue, // Standard blue color for links
        fontSize: 16,
        decoration: TextDecoration.underline, // Underline to mimic a hyperlink
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
