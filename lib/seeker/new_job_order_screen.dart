// import 'package:flutter/material.dart';
// import 'package:tovali_2/main.dart';

// // Job Request Model
// class JobRequest {
//   final String category;
//   final String description;
//   final String priceType;
//   final double amount;
//   final String location;
//   final DateTime date;
//   final TimeOfDay time;
//   String status;

//   JobRequest({
//     required this.category,
//     required this.description,
//     required this.priceType,
//     required this.amount,
//     required this.location,
//     required this.date,
//     required this.time,
//     this.status = 'פעיל',
//   });
// }

// class NewJobRequestScreen extends StatefulWidget {
//   final Function(JobRequest) onSubmit;

//   const NewJobRequestScreen({super.key, required this.onSubmit});

//   @override
//   _NewJobRequestScreenState createState() => _NewJobRequestScreenState();
// }

// class _NewJobRequestScreenState extends State<NewJobRequestScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _category = 'עזרה כללית';
//   String _description = '';
//   String _priceType = 'לפי שעה';
//   double _amount = 0.0;
//   String _location = '';
//   DateTime? _date;
//   TimeOfDay? _time;

//   List<String> categories = ['תחזוקה וטיפול בבית', 'הובלה ושינוע', 'עזרה כללית', 'טיפול בבעלי חיים'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('הזמנת עבודה חדשה'),
//       ),
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 DropdownButtonFormField<String>(
