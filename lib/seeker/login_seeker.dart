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

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'verify_otp_seeker_login.dart';

// class LoginSeekerScreen extends StatefulWidget {
//   const LoginSeekerScreen({super.key});

//   @override
//   _LoginSeekerScreenState createState() => _LoginSeekerScreenState();
// }

// class _LoginSeekerScreenState extends State<LoginSeekerScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String _verificationId = '';

//   void _sendOTP() async {
//     final phoneNumber = _phoneController.text.trim();

//     if (phoneNumber.isEmpty) {
//       // Show an error if the phone number is empty
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Phone number cannot be empty")));
//       return;
//     }

//     await _auth.verifyPhoneNumber(
//       phoneNumber: '+972$phoneNumber', // Add country code for the phone number
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // When verification is completed automatically (rare)
//         await _auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//   print("Verification failed: ${e.code} - ${e.message}");
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text("Error: ${e.code} - ${e.message}"))
//   );
// },
//       codeSent: (String verificationId, int? resendToken) {
//         // Store the verification ID to use later when verifying OTP
//         setState(() {
//           _verificationId = verificationId;
//         });
//         _navigateToOTP();
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         // Auto-retrieval timed out, store the verification ID
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//     );
//   }

//   void _navigateToOTP() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => VerifyOTPPageseekerlogin(verificationId: _verificationId)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login as Seeker")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//               keyboardType: TextInputType.phone,
//             ),
//             ElevatedButton(
//               onPressed: _sendOTP, // Call this to send OTP
//               child: Text('Next'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
