import 'package:flutter/material.dart';
import 'home_page.dart'; // Adjust the import path according to your file structure

class SuccessApplyScreen extends StatelessWidget {
  const SuccessApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Success")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text('הבקשה נשלחה בהצלחה!', style: TextStyle(fontSize: 22)),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
              },
              child: Text('חזור לדף הראשי', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
