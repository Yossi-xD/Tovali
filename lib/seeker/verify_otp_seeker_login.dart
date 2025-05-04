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
      MaterialPageRoute(builder: (context) => SeekerDashboardPage()),
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

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tovali_2/main.dart';

// class VerifyOTPPageseekerlogin extends StatefulWidget {
//   final String verificationId;

//   VerifyOTPPageseekerlogin({required this.verificationId});

//   @override
//   _VerifyOTPPageseekerloginState createState() => _VerifyOTPPageseekerloginState();
// }

// class _VerifyOTPPageseekerloginState extends State<VerifyOTPPageseekerlogin> {
//   final TextEditingController _otpController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _verifyOTP() async {
//     String otp = _otpController.text.trim();

//     if (otp.isEmpty) {
//       // Show error if OTP is empty
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter the OTP")));
//       return;
//     }

//     try {
//       // Create a PhoneAuthCredential with the entered OTP and verification ID
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: otp,
//       );

//       // Sign in the user using the credential
//       await _auth.signInWithCredential(credential);

//       // Navigate to the next screen after successful login
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()), // Replace with your next screen
//       );
//     } catch (e) {
//       // Handle error in OTP verification
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to verify OTP")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Verify OTP")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _otpController,
//               decoration: InputDecoration(labelText: 'Enter OTP'),
//               keyboardType: TextInputType.number,
//             ),
//             ElevatedButton(
//               onPressed: _verifyOTP, // Verify the OTP
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
