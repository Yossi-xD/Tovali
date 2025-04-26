import 'package:flutter/material.dart';
import 'provider/signup_provider.dart';
import 'seeker/signup_seeker.dart';
import 'provider/login_provider.dart';
import 'seeker/login_seeker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blue, 
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        fontFamily: 'Roboto',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOVALI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'TOVALI',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: 2,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpProviderScreen()),
                        );
                      },
                      child: Text("הרשמה כספק שירות", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpSeekerScreen()),
                        );
                      },
                      child: Text("הרשמה כמחפש שירות", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),

            // Align the login buttons at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Adds some space from the bottom
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginProviderScreen()),
                      );
                    },
                    child: Text("התחברות כספק שירות", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginSeekerScreen()),
                      );
                    },
                    child: Text("התחברות כמחפש שירות", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
