// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// class WorkMapScreen extends StatefulWidget {
//   const WorkMapScreen({super.key});

//   @override
//   _WorkMapScreenState createState() => _WorkMapScreenState();
// }

// class _WorkMapScreenState extends State<WorkMapScreen> {
//   late GoogleMapController mapController;
//   final Set<Marker> _markers = {};  // Define your markers
//   static const LatLng _center = LatLng(32.0853, 34.7818); // Default location, e.g., Tel Aviv

//   @override
//   void onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   Future<void> fetchJobs() async {
//     // Simulate fetching job data (replace with real data fetching)
//     List<JobRequest> jobs = [
//       JobRequest("Job 1", 32.0800, 34.7800),
//       JobRequest("Job 2", 32.0900, 34.7900),
//     ];
//     addMarkersFromJobData(jobs);
//   }

//   void addMarker(LatLng position, String title) {
//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: MarkerId(title),
//           position: position,
//           infoWindow: InfoWindow(title: title),
//         ),
//       );
//     });
//   }

//   void addMarkersFromJobData(List<JobRequest> jobRequests) {
//     for (var job in jobRequests) {
//       addMarker(LatLng(job.latitude, job.longitude), job.title);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchJobs(); // Fetch job data when the screen is initialized
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('מפת עבודות'),
//         backgroundColor: Colors.blue,
//       ),
//       body: GoogleMap(
//         onMapCreated: onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 10,
//         ),
//         markers: _markers,
//         mapType: MapType.normal,
//         zoomControlsEnabled: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           mapController.animateCamera(
//             CameraUpdate.newCameraPosition(
//               CameraPosition(
//                 target: _center,
//                 zoom: 14,
//               ),
//             ),
//           );
//         },
//         backgroundColor: Colors.blue,
//         child: Icon(Icons.zoom_in),
//       ),
//     );
//   }
// }

// class JobRequest {
//   final String title;
//   final double latitude;
//   final double longitude;

//   JobRequest(this.title, this.latitude, this.longitude);
// }
