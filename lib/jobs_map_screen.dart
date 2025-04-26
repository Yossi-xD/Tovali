// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class JobsMapScreen extends StatefulWidget {
//   const JobsMapScreen({super.key});

//   @override
//   _JobsMapScreenState createState() => _JobsMapScreenState();
// }

// class _JobsMapScreenState extends State<JobsMapScreen> {
//   late GoogleMapController mapController;
//   final LatLng _israelCenter = LatLng(31.4117, 35.0818);
//   Set<Marker> _markers = {};
//   String _selectedCategory = 'הכל';
//   String _selectedAvailability = 'הכל';

//   @override
//   void initState() {
//     super.initState();
//     _loadMarkers();
//   }

//   void _loadMarkers() {
//     // Sample data - in real app, fetch from API
//     setState(() {
//       _markers = {
//         Marker(
//           markerId: MarkerId('1'),
//           position: LatLng(32.0853, 34.7818), // Tel Aviv
//           infoWindow: InfoWindow(
//             title: 'עזרה בגינה',
//             snippet: 'גיזום עצים קטנים, מחיר: 120 ש"ח',
//           ),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//         ),
//         Marker(
//           markerId: MarkerId('2'),
//           position: LatLng(31.2525, 34.7915), // Beer Sheva
//           infoWindow: InfoWindow(
//             title: 'הובלה קטנה',
//             snippet: 'הובלת רהיטים בתוך העיר, מחיר: 200 ש"ח',
//           ),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//         ),
//       };
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('מפת עבודות'),
//         backgroundColor: Color(0xFF1976D2),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: (controller) => mapController = controller,
//             initialCameraPosition: CameraPosition(
//               target: _israelCenter,
//               zoom: 7,
//             ),
//             markers: _markers,
//           ),
//           Positioned(
//             top: 10,
//             right: 10,
//             child: Column(
//               children: [
//                 _buildFilterDropdown(
//                   value: _selectedCategory,
//                   items: ['הכל', 'עזרה בגינה', 'הובלה', 'תיקונים'],
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategory = value!;
//                       // Filter markers
//                     });
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 _buildFilterDropdown(
//                   value: _selectedAvailability,
//                   items: ['הכל', 'עכשיו', 'היום', 'מחר'],
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedAvailability = value!;
//                       // Filter markers
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => mapController.animateCamera(
//               CameraUpdate.zoomIn(),
//             ),
//             mini: true,
//             child: Icon(Icons.zoom_in),
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: () => mapController.animateCamera(
//               CameraUpdate.zoomOut(),
//             ),
//             mini: true,
//             child: Icon(Icons.zoom_out),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFilterDropdown({
//     required String value,
//     required List<String> items,
//     required Function(String?) onChanged,
//   }) {
//     return Container(
//       width: 150,
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: DropdownButton<String>(
//         value: value,
//         isExpanded: true,
//         underline: SizedBox(),
//         items: items.map((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         onChanged: onChanged,
//       ),
//     );
//   }
// }