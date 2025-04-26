import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double _rating = 0.0;
  String _comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ביקורת על נותן השירות'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Rating Widget
            Text('דירוג נותן השירות'),
            Slider(
              value: _rating,
              min: 0.0,
              max: 5.0,
              divisions: 5,
              label: _rating.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Comment Text Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'תגובה מילולית',
                hintText: 'כתוב את חווית השירות שלך',
              ),
              maxLines: 3,
              onChanged: (value) {
                setState(() {
                  _comment = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle submission of review
                print("Rating: $_rating");
                print("Comment: $_comment");
                // You could save or send this data to the server here
              },
              child: Text('שלח ביקורת'),
            ),
          ],
        ),
      ),
    );
  }
}
