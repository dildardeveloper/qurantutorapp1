// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'dart:async';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   Completer<GoogleMapController> _controller = Completer();
//   GoogleMapController? mapController;
//   Position? currentPosition;
//   String? searchAddress;
//   TextEditingController locationController = TextEditingController();
//   List<Marker> markers = [];

//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   void getCurrentLocation() async {
//     currentPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {});
//   }

//   void searchPlace() async {
//     Prediction? p = await PlacesAutocomplete.show(
//         context: context,
//         apiKey: "AIzaSyBiU3epT_ypQmUvG8TErc-UNS92YhDvKZc",
//         mode: Mode.overlay, // Mode.fullscreen
//         language: "en",
//         components: [Component(Component.country, "us")]);
//     if (p != null) {
//       displayPrediction(p);
//     }
//   }

//   void displayPrediction(Prediction p) async {
//     if (p.placeId != null) {
//       PlacesDetailsResponse detail =
//           await GoogleMapsPlaces(apiKey: "YOUR_API_KEY_HERE")
//               .getDetailsByPlaceId(p.placeId!);
//       if (detail.result != '' && detail.result.geometry != null) {
//         double lat = detail.result.geometry!.location.lat;
//         double lng = detail.result.geometry!.location.lng;
//         String? address = detail.result.formattedAddress;
//         mapController
//             ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//           target: LatLng(lat, lng),
//           zoom: 16,
//         )));
//         setState(() {
//           searchAddress = address ?? '';
//           locationController.text = searchAddress!;
//           markers.add(Marker(
//               markerId: MarkerId(searchAddress!),
//               position: LatLng(lat, lng),
//               infoWindow:
//                   InfoWindow(title: searchAddress, snippet: 'go here')));
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Demo'),
//         centerTitle: true,
//       ),
//       body: Stack(children: [
//         if (currentPosition != null) // Add null check
//           GoogleMap(
//             mapType: MapType.normal,
//             initialCameraPosition: CameraPosition(
//                 target: LatLng(currentPosition?.latitude ?? 0.0,
//                     currentPosition?.longitude ?? 0.0),
//                 zoom: 14.0),
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//               mapController = controller;
//             },
//             markers: markers.toSet(),
//           )
//         else
//           Center(
//             child: CircularProgressIndicator(),
//           ), // Show loading indicator if current location is not available
//         Positioned(
//           top: 10.0,
//           right: 15.0,
//           left: 15.0,
//           child: Container(
//             height: 50.0,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey,
//                   offset: Offset(2.0, 2.0),
//                   blurRadius: 5.0,
//                 ),
//               ],
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Enter Address',
//                 border: InputBorder.none,
//                 contentPadding:
//                     EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchAddress = value;
//                 });
//               },
//               controller: locationController,
//               onSubmitted: (value) {
//                 // Do something when the user submits the text field
//               },
//               onTap: () async {
//                 // Generate predictions when the user taps on the text field
//                 Prediction? p = await PlacesAutocomplete.show(
//                   context: context,
//                   apiKey: 'AIzaSyBiU3epT_ypQmUvG8TErc-UNS92YhDvKZc',
//                   mode: Mode
//                       .overlay, // Show the autocomplete suggestions as an overlay
//                   language: "en",
//                   components: [
//                     Component(Component.country, "us"),
//                   ],
//                 );
//                 displayPrediction(p!);
//               },
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/user/usercreateprofile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Demo',
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.9693, 70.9428),
    zoom: 14.4746,
  );
  //List<Marker> _marker = [];
  List<Marker> _marker = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(30.9693, 70.9428),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
    // Marker(
    //     markerId: MarkerId('2'),
    //     position: LatLng(30.7750, 70.9368),
    //     infoWindow: InfoWindow(
    //       title: 'kotsultan bypass',
    //     )),
  ];
  Future<Position> getusercurrentlocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      displayMessage("ok");
    });
    return await Geolocator.getCurrentPosition();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _marker.addAll(_list);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: SafeArea(
        child: GoogleMap(
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_marker),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.center,
          height: 43,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xff3F48CC),
          ),
          child: TextButton(
            onPressed: () async {
              getusercurrentlocation().then((value) async {
                print("my current location");
                print(
                    value.latitude.toString() + "" + value.latitude.toString());
                _marker.add(
                  Marker(
                    markerId: MarkerId('2'),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(title: 'my current location'),
                  ),
                );
                CameraPosition cameraPosition = CameraPosition(
                  zoom: 14,
                  target: LatLng(value.latitude, value.longitude),
                );
                GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => createprofile(
                      userid: '',
                      latitude: value.latitude,
                      longitude: value.longitude,
                    ),
                  ),
                );
              });
            },
            child: Text(
              'Get Current Location',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
