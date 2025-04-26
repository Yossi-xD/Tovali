import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _language = 'עברית';

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('שינוי סיסמה'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'סיסמה נוכחית'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'סיסמה חדשה'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'אימות סיסמה חדשה'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ביטול'),
          ),
          ElevatedButton(
            onPressed: () {
              // Change password logic
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1976D2),
            ),
            child: Text('שמור'),
          ),
        ],
      ),
    );
  }

  void _confirmAccountDeletion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('מחיקת חשבון'),
        content: Text('האם אתה בטוח שברצונך למחוק את החשבון? פעולה זו לא ניתנת לביטול.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ביטול'),
          ),
          ElevatedButton(
            onPressed: () {
              // Delete account logic
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text('מחק חשבון'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('הגדרות'),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.lock, color: Color(0xFF1976D2)),
            title: Text('שינוי סיסמה'),
            onTap: _showChangePasswordDialog,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Color(0xFF1976D2)),
            title: Text('שפה'),
            trailing: DropdownButton<String>(
              value: _language,
              underline: SizedBox(),
              items: ['עברית', 'English']
                  .map((lang) => DropdownMenuItem<String>(
                        value: lang,
                        child: Text(lang),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _language = value!;
                });
              },
            ),
          ),
          Divider(),
          SwitchListTile(
            secondary: Icon(Icons.notifications, color: Color(0xFF1976D2)),
            title: Text('התראות'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('מחיקת חשבון', style: TextStyle(color: Colors.red)),
            onTap: _confirmAccountDeletion,
          ),
        ],
      ),
    );
  }
}