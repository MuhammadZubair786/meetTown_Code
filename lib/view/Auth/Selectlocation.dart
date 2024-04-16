import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meettown/view/Auth/SelectPassPort.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import '../../res/appcolors.dart';


import '../../res/components/custom_button.dart';

class SetLoctationScreen extends StatefulWidget {
  const SetLoctationScreen({super.key});

  @override
  State<SetLoctationScreen> createState() => _SetLoctationScreenState();
}

class _SetLoctationScreenState extends State<SetLoctationScreen> {
  Completer<GoogleMapController> _mapcontroller = Completer();
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(24.8818313, 67.0787088), zoom: 14);
  GoogleMapController? mapController;
  final List<Marker> _marker = [];

  final GooglePlace googlePlace = GooglePlace(
      'AIzaSyCnZXerorXnf76z7k9K9anfjxTGTO5hdIM'); // Replace with your API key
  TextEditingController searchController = TextEditingController();
  List suggestions = [];

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> _updateMarkerPosition(LatLng newPosition) async {
    // List<Placemark> placemarks = await placemarkFromCoordinates(
    //     newPosition.latitude, newPosition.longitude);
    // Placemark placemark = placemarks[0];
    // print(lat);
    // print(long);
    setState(() {
      _marker.clear(); // Clear the previous markers.
      _marker.add(
        Marker(
          markerId: MarkerId("userMarker"),
          position: newPosition,
          infoWindow: InfoWindow(
              title:
                  "Current Location"),
        ),
      );
    });
  }

  Future<void> requestLocationPermission() async {
    final permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      // Permission granted, proceed to get the location.
      getCurrentLocation();
    } else {
      // Handle denied or restricted permission.
      // You can display a message or take appropriate action.
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      GoogleMapController controller = await _mapcontroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 14)));

      // Access the latitude and longitude from the `position` object.
      double latitude = position.latitude;
      double longitude = position.longitude;

     
      // print('Latitude: $lat, Longitude: $long');
      // latLong = LatLng(latitude, longitude);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark placemark = placemarks[0];
    

      setState(() {
        _marker.add(
          Marker(
            markerId: MarkerId("userMarker"),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
                title:
                    "${placemark.subLocality}, ${placemark.locality}, ${placemark.country}"),
          ),
        );
      });
    } catch (e) {
      // Handle any errors that occur while getting the location.
      print('Error getting location: $e');
    }
  }

  void _onChanged(String query) async {
    // print(query);
    if (query.isNotEmpty) {
      final result = await googlePlace.autocomplete.get(query);
      if (result != null && result.predictions!.isNotEmpty) {
        // print(result.predictions);
        setState(() {
          suggestions = result.predictions!;
        });
      }
    } else {
      setState(() {
        suggestions = [];
      });
    }
  }

  Future<void> _handleSuggestionSelection(place_id) async {
    try {
      final details = await googlePlace.details.get(place_id);
      final geometry = details!.result!.geometry;
      final location = geometry!.location;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(location!.lat!, location.lng!);
      Placemark placemark = placemarks[0];

     

      GoogleMapController controller = await _mapcontroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(location.lat!, location.lng!), zoom: 14)));
   

      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(location.lat!, location.lng!), zoom: 14)));
      _marker.add(
        Marker(
          markerId: MarkerId("userMarker"),
          position: LatLng(location.lat!, location.lng!),
          infoWindow: InfoWindow(
              title:
                  "${placemark.subLocality}, ${placemark.locality}, ${placemark.country}"),
        ),
      );

      setState(() {
        initialCameraPosition = CameraPosition(
            target: LatLng(location.lat!, location.lng!), zoom: 14);
        suggestions = [];
      });

      // You can use selectedLatitude and selectedLongitude as needed.
      // print('Selected Latitude: ${location!.lat}');
    } catch (e) {
      print('Error fetching place details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: GestureDetector(
        //   // onTap: () => Get.back(),
        //   // child: Icon(
        //   //   Icons.arrow_back,
        //   //   color: Colors.white,
        //   // ),
        // ),
        title: Text(
          'Set Location',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: appColors.textBlueColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
            Text("",
            style: TextStyle(fontSize: 25,fontFamily: "arial"),
            ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              compassEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              onTap: (LatLng tappedPoint) {
                _updateMarkerPosition(tappedPoint);
              },
              initialCameraPosition: initialCameraPosition,
              markers: Set<Marker>.of(_marker),
              onMapCreated: (GoogleMapController controller) {
                _mapcontroller.complete(controller);
              },
            ),
          ),
          Column(
            children: [
              // 20.verticalSpace,
              SizedBox(height: 20,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  // height: 55.h,
                  child: TextFormField(
                    controller: searchController,
                    onChanged: _onChanged,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                      ),
                      hintText: "Search Location",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xff667080)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff667080)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff667080)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff667080)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        searchController.text = suggestions[index].description;
                      });
                      _handleSuggestionSelection(suggestions[index].placeId);
                    },
                    child: Container(
                      color: Colors.white,
                      child:
                          ListTile(title: Text(suggestions[index].description)),
                    ),
                  );
                },
              ),
              Spacer(),
                 Container(
           
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButtonWidget(
                      title: 'Previous',
                      foregroundColor: appColors.iconPrimaryColor,
                      bgColor: appColors.textBlueColor,
                      selectedFgButtonColor: appColors.iconPrimaryColor,
                      onpress: () {}),
                  CustomButtonWidget(
                      title: 'Next',
                      foregroundColor: appColors.iconPrimaryColor,
                      bgColor: appColors.textBlueColor,
                      selectedFgButtonColor: appColors.iconPrimaryColor,
                      onpress: () {
                         Navigator.push(context,
        MaterialPageRoute(builder: (context) => PassportPage()));
                      }),
                ],
              ),
            )

            ],
          ),
         
          // Positioned(
          //   bottom: 100,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // print(latLong);
          //       // print(lat.toString());
          //       // print(long.toString());

          //       // Get.to(() => SelectZoneScreen());
          //     },
          //     colors: btnprimaryColor,
          //     width: 388.w,
          //     ButtonText: "Save",
          //     height: 50,
          //   ),
          // )
        ],
      ),
    );
  }
}