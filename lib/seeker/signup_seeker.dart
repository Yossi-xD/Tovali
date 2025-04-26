import 'package:flutter/material.dart';
import '../verify_otp_signup.dart';

class SignUpSeekerScreen extends StatefulWidget {
  const SignUpSeekerScreen({super.key});

  @override
  _SignUpSeekerScreenState createState() => _SignUpSeekerScreenState();
}

class _SignUpSeekerScreenState extends State<SignUpSeekerScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _acceptedTerms = false;

  void _navigateToOTP() {
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('יש לאשר את תנאי השימוש')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerifyOTPPagesignup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("הרשמה כמזמין שירות")),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'שם מלא'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'מספר טלפון'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(
                    """תקנון שירות:
1. השירות נועד לחיבור בין נותני ומזמיני שירות.
2. אסור להשתמש בפלטפורמה לפעילות בלתי חוקית.
3. התשלום מתבצע דרך המערכת בלבד.
4. אנו שומרים את הזכות להסיר משתמשים שמפרים את התקנון.
5. המידע האישי ישמש רק לצורך מתן השירות.
6. המשתמש מתחייב לספק מידע אמיתי ומדויק.
7. אסור לפרסם תוכן פוגעני או לא הולם.""",
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text('אני מאשר/ת שקראתי ומסכים/מה לתנאי השימוש'),
                value: _acceptedTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _acceptedTerms = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (!_acceptedTerms)
                Text(
                  'יש לאשר את תנאי השימוש',
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1976D2),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('המשך'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}