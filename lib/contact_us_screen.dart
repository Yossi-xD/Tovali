import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phone = '';
  String _email = '';
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('צור קשר איתנו'),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // Set the text direction to RTL
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                TextFormField(
                  decoration: InputDecoration(labelText: 'שם'),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס שם';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Phone Number
                TextFormField(
                  decoration: InputDecoration(labelText: 'טלפון'),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס טלפון';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Email
                TextFormField(
                  decoration: InputDecoration(labelText: 'דוא"ל'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס דוא"ל';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Message
                TextFormField(
                  decoration: InputDecoration(labelText: 'הודעה'),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      _message = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס הודעה';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      print('Name: $_name');
                      print('Phone: $_phone');
                      print('Email: $_email');
                      print('Message: $_message');
                      // Here you would handle sending this information to the server
                    }
                  },
                  child: Text('שלח הודעה'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
