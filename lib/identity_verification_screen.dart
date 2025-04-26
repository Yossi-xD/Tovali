import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:tovali_2/success_apply.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  _IdentityVerificationScreenState createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState extends State<IdentityVerificationScreen> {
  File? _idImage;
  File? _selfieImage;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickImage(bool isSelfie) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        if (isSelfie) {
          _selfieImage = File(pickedFile.path);
        } else {
          _idImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _submitVerification() async {
    if (_idImage == null || _selfieImage == null) {
      final proceed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('שים לב'),
          content: Text('לא צירפת תעודה או סלפי. האם ברצונך להמשיך בכל זאת?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('בטל'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('המשך'),
            ),
          ],
        ),
      );

      if (proceed != true) return;

      // Go directly to success page (skip upload)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SuccessApplyScreen()),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      var uri = Uri.parse('http://<YOUR_SERVER_IP>:3000/upload');
      var request = http.MultipartRequest('POST', uri);

      if (_idImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'id',
          _idImage!.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      if (_selfieImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'selfie',
          _selfieImage!.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SuccessApplyScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('שגיאה בשליחת המידע: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('אירעה שגיאה: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('אימות זהות')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('1. צלם תעודה מזהה', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Center(
                child: _idImage != null
                    ? Image.file(_idImage!, height: 150)
                    : TextButton.icon(
                        icon: Icon(Icons.credit_card),
                        label: Text('צלם תעודה'),
                        onPressed: () => _pickImage(false),
                      ),
              ),
              SizedBox(height: 24),
              Text('2. צלם סלפי', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Center(
                child: _selfieImage != null
                    ? Image.file(_selfieImage!, height: 150)
                    : TextButton.icon(
                        icon: Icon(Icons.camera_alt),
                        label: Text('צלם סלפי'),
                        onPressed: () => _pickImage(true),
                      ),
              ),
              Spacer(),
              Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submitVerification,
                        child: Text('שלח לאימות'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
