import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('מדיניות פרטיות'),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'מדיניות פרטיות',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildPolicySection(
                title: 'איסוף מידע',
                content:
                    'אנו אוספים את המידע הדרוש לנו כדי לספק את השירותים שלך. זה כולל את פרטי הקשר שלך, מיקום, ותיאור העבודות שאתה מפרסם או מבצע.',
              ),
              _buildPolicySection(
                title: 'שימוש במידע',
                content:
                    'המידע שלך ישמש כדי לחבר אותך עם נותני שירות או מזמיני שירות, לעבד תשלומים, ולשפר את חוויית השימוש שלך באפליקציה.',
              ),
              _buildPolicySection(
                title: 'שיתוף מידע',
                content:
                    'פרטי הקשר שלך יוצגו רק לצד השני בעסקה. לא נשתף את המידע שלך עם צדדים שלישיים ללא הסכמתך, למעט כאשר הדבר נדרש על פי חוק.',
              ),
              _buildPolicySection(
                title: 'אבטחה',
                content:
                    'אנו משתמשים באמצעי אבטחה מתקדמים כדי להגן על המידע שלך. עם זאת, אין מערכת אבטחה מושלמת ואנו לא יכולים להבטיח אבטחה מוחלטת.',
              ),
              _buildPolicySection(
                title: 'שינויים במדיניות',
                content:
                    'אנו עשויים לעדכן מדיניות זו מעת לעת. שינויים משמעותיים יפורסמו באפליקציה.',
              ),
              SizedBox(height: 20),
              Text(
                'עדכון אחרון: 01/01/2023',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPolicySection({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1976D2),
            ),
          ),
          SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }
}