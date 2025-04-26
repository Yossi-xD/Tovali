import 'package:flutter/material.dart';

class NewJobRequestScreen extends StatefulWidget {
  const NewJobRequestScreen({super.key});

  @override
  _NewJobRequestScreenState createState() => _NewJobRequestScreenState();
}

class _NewJobRequestScreenState extends State<NewJobRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String _category = 'עזרה כללית';
  String _description = '';
  final String _priceType = 'לפי שעה';
  final double _amount = 0.0;
  final String _location = '';
  DateTime? _date;
  TimeOfDay? _time;
  final TextEditingController _categorySearchController = TextEditingController();
  List<String> filteredCategories = [];

  final Map<String, List<String>> categoryKeywords = {
    'תחזוקה וטיפול בבית': ['לתקן', 'תיקון', 'שקע', 'מנורה', 'צביעה', 'צבע', 'קיר', 'מדף', 'לקדוח', 'לתלות', 'הרכבה', 'פירוק', 'ארון', 'רהיט', 'טלוויזיה'],
    'הובלה ושינוע': ['הובלה', 'להעביר', 'רהיט', 'מקרר', 'טנדר', 'הובלה קטנה', 'שינוע'],
    'עזרה כללית': ['סידור', 'עזרה', 'בלגן', 'מחסן', 'עוזר', 'לארגן', 'עבודה פשוטה'],
    'טיפול בבעלי חיים': ['כלב', 'חתול', 'טיול', 'האכלה', 'לשמור על', 'להוציא לטיול'],
    'עזרה בגינה': ['גינה', 'גינון', 'גזם', 'שתילה', 'ניקוי גינה', 'אדמה'],
    'שליחויות וסידורים': ['שליחות', 'איסוף', 'למסור', 'חבילה', 'להביא', 'משלוח', 'דואר'],
    'סיוע לאזרחים ותיקים': ['קשיש', 'ליווי', 'קופת חולים', 'עזרה למבוגרים', 'סיוע', 'סידורים'],
    'סיוע טכנולוגי': ['טלפון', 'מחשב', 'אינטרנט', 'הגדרות', 'התקנה', 'טלוויזיה חכמה'],
    'עזרה בקניות וסידורים אישיים': ['קניות', 'סופר', 'מכולת', 'תרופה', 'בית מרקחת', 'שוק', 'קניית מוצר'],
    'עזרה בלמידה / שיעורים פרטיים': ['שיעורים', 'לימודים', 'מבחן', 'לקרוא', 'שיעורי בית', 'הסבר'],
    'אריזה ופריקה': ['לעבור דירה', 'לארוז', 'לפרוק', 'ארגזים', 'קרטונים'],
    'ליווי חברתי / שיחת חולין': ['לשוחח', 'לשבת לקפה', 'חברה', 'לבלות', 'שיחה', 'הפגת בדידות'],
    'השאלת כלים / עזרה בציוד': ['להשאיל', 'כלי', 'ציוד', 'סולם', 'כבל', 'מברגה', 'פטיש', 'חד פעמי'],
  };

  @override
  void initState() {
    super.initState();
    filteredCategories = categoryKeywords.keys.toList();
  }

  void _identifyCategory(String text) {
    text = text.toLowerCase();
    for (var category in categoryKeywords.keys) {
      for (var keyword in categoryKeywords[category]!) {
        if (text.contains(keyword)) {
          setState(() {
            _category = category;
          });
          return;
        }
      }
    }
    setState(() {
      _category = 'עזרה כללית';
    });
  }

  void _filterCategories(String query) {
    setState(() {
      filteredCategories = categoryKeywords.keys
          .where((category) => category.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('הזמנת עבודה חדשה'),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text('קטגוריה מזוהה: $_category', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _categorySearchController,
                  decoration: InputDecoration(
                    labelText: 'חפש קטגוריה',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: _filterCategories,
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredCategories[index]),
                        onTap: () {
                          setState(() {
                            _category = filteredCategories[index];
                            _categorySearchController.clear();
                            _filterCategories('');
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'תיאור מילולי של העבודה'),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                    _identifyCategory(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס תיאור של העבודה';
                    }
                    return null;
                  },
                ),
                // Rest of the form fields remain the same...
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit form
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1976D2),
                  ),
                  child: Text('שלח עבודה'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}