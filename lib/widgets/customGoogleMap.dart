import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import '../blocs/application_bloc.dart';

// class CustomGoogleMap extends StatelessWidget {
//   final LatLng initialPosition;

//   CustomGoogleMap({required this.initialPosition});

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: initialPosition,
//         zoom: 15.0,
//       ),
//       mapType: MapType.normal,
//       // Other Google Map configurations can be added here
//     );
//   }
// }


class CustomGoogleMap extends StatelessWidget {
  final LatLng initialPosition;

   CustomGoogleMap({required this.initialPosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialPosition,
            zoom: 15.0,
          ),
          mapType: MapType.normal,
          // Other Google Map configurations can be added here
        ),
        Positioned(
          top: 16.0,
          left: 16.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text(
              'Floating Widget',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}