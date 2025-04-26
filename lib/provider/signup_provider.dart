// import 'package:flutter/material.dart';
// import 'verify_otp_signup.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class SignUpProviderScreen extends StatefulWidget {
//   const SignUpProviderScreen({super.key});

//   @override
//   _SignUpProviderScreenState createState() => _SignUpProviderScreenState();
// }

// class _SignUpProviderScreenState extends State<SignUpProviderScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _passwordController = TextEditingController();

//   String? _selectedService;
//   String? _selectedArea;
//   String? _selectedCarType;
//   XFile? _idImage;
//   bool _termsAccepted = false;

//   // Dropdown lists
//   final List<String> _services = ['שירות 1', 'שירות 2', 'שירות 3'];
//   final List<String> _areas = ['אזור 1', 'אזור 2', 'אזור 3'];
//   final List<String> _carTypes = ['סוג רכב 1', 'סוג רכב 2', 'סוג רכב 3'];

//   // Days and Hours selection
//   String? _selectedDay;
//   String? _selectedHour;

//   final List<String> _days = List.generate(8, (i) => '$i'); // 0-7
//   final List<String> _hours = List.generate(25, (i) => '$i'); // 0-24

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _idImage = image;
//       });
//     }
//   }

//   void _submitForm() {
//      if (//_formKey.currentState!.validate() &&
//     //     _selectedService != null &&
//     //     _selectedArea != null &&
//     //     _selectedCarType != null &&
//     //     _selectedDay != null &&
//     //     _selectedHour != null &&
//         // _idImage != null &&
//         _termsAccepted) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => VerifyOTPPagesignup()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all required fields')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: Text('הרשמה', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: Directionality(
//         textDirection: TextDirection.rtl, // Set RTL layout
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 // First & Last Name Fields
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _firstNameController,
//                         decoration: InputDecoration(labelText: 'שם פרטי', hintText: '*'),
//                         validator: (val) => val!.isEmpty ? 'Required' : null,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: TextFormField(
//                         controller: _lastNameController,
//                         decoration: InputDecoration(labelText: 'שם משפחה', hintText: '*'),
//                         validator: (val) => val!.isEmpty ? 'Required' : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),

//                 // Phone Number Field
//                 TextFormField(
//                   controller: _phoneController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(labelText: 'מספר טלפון', hintText: '*'),
//                   validator: (val) => val!.isEmpty ? 'Required' : null,
//                 ),
//                 SizedBox(height: 16),

//                 // Password Field
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(labelText: 'סיסמא', hintText: '*'),
//                   validator: (val) => val!.isEmpty ? 'Required' : null,
//                 ),
//                 SizedBox(height: 16),

//                 // Service Dropdown
//                 DropdownButtonFormField(
//                   decoration: InputDecoration(labelText: 'בחר שירות'),
//                   items: _services
//                       .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//                       .toList(),
//                   onChanged: (val) => setState(() => _selectedService = val),
//                   validator: (val) => val == null ? 'Required' : null,
//                 ),
//                 SizedBox(height: 16),

//                 // Area Dropdown
//                 DropdownButtonFormField(
//                   decoration: InputDecoration(labelText: 'אזור פעילות'),
//                   items: _areas
//                       .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//                       .toList(),
//                   onChanged: (val) => setState(() => _selectedArea = val),
//                   validator: (val) => val == null ? 'Required' : null,
//                 ),
//                 SizedBox(height: 16),

//                 // Activity Days and Hours selection
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownButtonFormField(
//                         decoration: InputDecoration(labelText: 'בחר יום'),
//                         items: _days
//                             .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//                             .toList(),
//                         onChanged: (val) => setState(() => _selectedDay = val),
//                         validator: (val) => val == null ? 'Required' : null,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField(
//                         decoration: InputDecoration(labelText: 'בחר שעה'),
//                         items: _hours
//                             .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//                             .toList(),
//                         onChanged: (val) => setState(() => _selectedHour = val),
//                         validator: (val) => val == null ? 'Required' : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),

//                 // Upload ID Image Square
//                 InkWell(
//                   onTap: _pickImage,
//                   child: Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: _idImage == null
//                         ? Center(child: Text('Upload ID/License'))
//                         : Image.file(File(_idImage!.path), fit: BoxFit.cover),
//                   ),
//                 ),
//                 SizedBox(height: 16),

//                 // Terms Checkbox
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _termsAccepted,
//                       onChanged: (val) {
//                         setState(() => _termsAccepted = val!);
//                       },
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text('אישור תנאים', style: TextStyle(color: Colors.blue)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),

//                 // Submit Button
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   child: Text('שליחת בקשה להרשמה', style: TextStyle(fontSize: 18, color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../verify_otp_signup.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpProviderScreen extends StatefulWidget {
  const SignUpProviderScreen({super.key});

  @override
  _SignUpProviderScreenState createState() => _SignUpProviderScreenState();
}

class _SignUpProviderScreenState extends State<SignUpProviderScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedService;
  String? _selectedArea;
  String? _selectedCarType;
  XFile? _idImage;
  bool _termsAccepted = false;
  bool _termsViewed = false; // Flag to track if terms have been viewed

  // Dropdown lists
  final List<String> _services = ['שירות 1', 'שירות 2', 'שירות 3'];
  final List<String> _areas = ['אזור 1', 'אזור 2', 'אזור 3'];
  final List<String> _carTypes = ['סוג רכב 1', 'סוג רכב 2', 'סוג רכב 3'];

  // Days and Hours selection
  String? _selectedDay;
  String? _selectedHour;

  final List<String> _days = List.generate(8, (i) => '$i'); // 0-7
  final List<String> _hours = List.generate(25, (i) => '$i'); // 0-24

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _idImage = image;
      });
    }
  }

  void _submitForm() {
    if ( // _formKey.currentState!.validate() &&
        // _selectedService != null &&
        // _selectedArea != null &&
        // _selectedCarType != null &&
        // _selectedDay != null &&
        // _selectedHour != null &&
        // _idImage != null &&
        _termsAccepted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerifyOTPPagesignup()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields and accept terms')),
      );
    }
  }

  // Show Terms and Conditions in a dialog
  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('תנאים ותקנות', style: TextStyle(color: Colors.blue)),
          content: SingleChildScrollView(
            child: Text(
              'הכנס את התנאים והתקנות שלך כאן...',
              style: TextStyle(fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _termsViewed = true; // Mark terms as viewed
                });
                Navigator.of(context).pop();
              },
              child: Text('סגור'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Changed to blue
        title: Text('הרשמה', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // Set RTL layout
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // First & Last Name Fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'שם פרטי', hintText: '*'),
                        validator: (val) => val!.isEmpty ? 'Required' : null,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(labelText: 'שם משפחה', hintText: '*'),
                        validator: (val) => val!.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Phone Number Field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'מספר טלפון', hintText: '*'),
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                ),
                SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'סיסמא', hintText: '*'),
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                ),
                SizedBox(height: 16),

                // Service Dropdown
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'בחר שירות'),
                  items: _services
                      .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedService = val),
                  validator: (val) => val == null ? 'Required' : null,
                ),
                SizedBox(height: 16),

                // Area Dropdown
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'אזור פעילות'),
                  items: _areas
                      .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedArea = val),
                  validator: (val) => val == null ? 'Required' : null,
                ),
                SizedBox(height: 16),

                // Activity Days and Hours selection
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(labelText: 'בחר יום'),
                        items: _days
                            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                            .toList(),
                        onChanged: (val) => setState(() => _selectedDay = val),
                        validator: (val) => val == null ? 'Required' : null,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(labelText: 'בחר שעה'),
                        items: _hours
                            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                            .toList(),
                        onChanged: (val) => setState(() => _selectedHour = val),
                        validator: (val) => val == null ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Upload ID Image Square
                InkWell(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _idImage == null
                        ? Center(child: Text('Upload ID/License'))
                        : Image.file(File(_idImage!.path), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 16),

                // Terms Checkbox (Accept terms)
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (val) {
                        if (_termsViewed) {  // Only allow checking if terms have been viewed
                          setState(() => _termsAccepted = val!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please view the terms first!')),
                          );
                        }
                      },
                    ),
                    GestureDetector(
                      onTap: _showTermsDialog, // Open Terms on tap
                      child: Text('אישור תנאים', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Changed to blue
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('שליחת בקשה להרשמה', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

