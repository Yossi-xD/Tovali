import 'package:flutter/material.dart';
import 'package:tovali_2/home_page.dart';

// Job Request Model
class JobRequest {
  final String category;
  final String description;
  final String priceType;
  final double amount;
  final String location;
  final DateTime date;
  final TimeOfDay time;
  String status;

  JobRequest({
    required this.category,
    required this.description,
    required this.priceType,
    required this.amount,
    required this.location,
    required this.date,
    required this.time,
    this.status = 'פעיל', // Default status is active
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Blue theme
        appBarTheme: AppBarTheme(
          color: Colors.blue, // Set AppBar color to blue
        ),
      ),
      home: SeekerDashboard(),
    );
  }
}

class SeekerDashboard extends StatefulWidget {
  const SeekerDashboard({super.key});

  @override
  _SeekerDashboardState createState() => _SeekerDashboardState();
}

class _SeekerDashboardState extends State<SeekerDashboard> {
  final List<JobRequest> _jobRequests = [];

  // Sample user details
  final String name = "יוסף יוסף";
  final String phone = "050-9876543";
  final String serviceAreas = "עזרה בבית, הובלה, גינון";

  // Add new job request
  void _addJobRequest(JobRequest jobRequest) {
    setState(() {
      _jobRequests.add(jobRequest);
    });
  }

  // Toggle status between Active/Inactive
  void _toggleStatus(int index) {
    setState(() {
      _jobRequests[index].status =
          _jobRequests[index].status == 'פעיל' ? 'לא פעיל' : 'פעיל';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('לוח מחוונים למזמין שירות'),
      ),
      drawer: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue, // Set Drawer header to blue
                ),
                child: Text(
                  'ברוך הבא למזמין שירות',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('פרופיל'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text('הגדרות'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.blue),
                title: Text('התנתק'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Profile section
                Container(
                  width: 300,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your image asset
                      ),
                      SizedBox(height: 16),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'טלפון: $phone',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'תחומי שירות: $serviceAreas',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Button to add new job request
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestScreen(
                          onSubmit: _addJobRequest,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Blue button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'הוספת עבודה',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Display job requests as cards
                for (int i = 0; i < _jobRequests.length; i++)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: ListTile(
                      title: Text(
                        _jobRequests[i].category,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('תיאור: ${_jobRequests[i].description}'),
                          Text('סכום: ${_jobRequests[i].amount} ש"ח'),
                          Text('מיקום: ${_jobRequests[i].location}'),
                          Text(
                            'תאריך: ${_jobRequests[i].date.toLocal()}'.split(' ')[0],
                          ),
                          Text('שעה: ${_jobRequests[i].time.format(context)}'),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _jobRequests[i].status,
                            style: TextStyle(
                              fontSize: 16,
                              color: _jobRequests[i].status == 'פעיל'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () => _toggleStatus(i),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestScreen extends StatefulWidget {
  final Function(JobRequest) onSubmit;

  const RequestScreen({super.key, required this.onSubmit});

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String _category = '';
  String _description = '';
  String _priceType = 'לפי שעה';
  double _amount = 0.0;
  String _location = '';
  DateTime? _date;
  TimeOfDay? _time;

  List<String> categories = ['עזרה בבית', 'הובלה', 'איסוף', 'משלוח', 'עזרה בגינה', 'עזרה כללית'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('הזמנת עבודה חדשה'),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Category Selection
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'בחירת קטגוריה'),
                  value: _category.isEmpty ? null : _category,
                  onChanged: (value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  items: categories
                      .map((category) => DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא בחר קטגוריה';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Description
                TextFormField(
                  decoration: InputDecoration(labelText: 'תיאור מילולי של העבודה'),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס תיאור של העבודה';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Price Type (Hourly or Per Job)
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'אפיון מחיר'),
                  value: _priceType,
                  onChanged: (value) {
                    setState(() {
                      _priceType = value!;
                    });
                  },
                  items: ['לפי שעה', 'לפי עבודה']
                      .map((price) => DropdownMenuItem<String>(
                            value: price,
                            child: Text(price),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא בחר סוג מחיר';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Amount
                TextFormField(
                  decoration: InputDecoration(labelText: 'סכום לתשלום'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _amount = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty || _amount <= 0) {
                      return 'אנא הכנס סכום לתשלום';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Location
                TextFormField(
                  decoration: InputDecoration(labelText: 'מיקום (עיר + רחוב)'),
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הכנס מיקום';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Date Picker
                TextFormField(
                  decoration: InputDecoration(labelText: 'תאריך ביצוע'),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != _date) {
                      setState(() {
                        _date = pickedDate;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _date == null ? '' : '${_date!.toLocal()}'.split(' ')[0],
                  ),
                ),
                SizedBox(height: 16),

                // Time Picker
                TextFormField(
                  decoration: InputDecoration(labelText: 'שעת ביצוע'),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null && pickedTime != _time) {
                      setState(() {
                        _time = pickedTime;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _time == null ? '' : _time!.format(context),
                  ),
                ),
                SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Submit the request and pass it to SeekerDashboard
                      widget.onSubmit(
                        JobRequest(
                          category: _category,
                          description: _description,
                          priceType: _priceType,
                          amount: _amount,
                          location: _location,
                          date: _date!,
                          time: _time!,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('הזמן עבודה'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
