import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_taxi_tigi_driver/assistance/assistanceMethode.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/vehicule.dart';
import 'package:flutter_taxi_tigi_driver/widgets/progressDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';

import '../infoHandler/app_info.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  final Completer<GoogleMapController> _googleMapController = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.6120094, -8.0146979),
    zoom: 15,
  );

  LocationPermission? _locationPermission;

  String statusText = "";
  Color buttonColor = MesCouleur().couleurPrincipal;
  bool isDriverActive = false;

  // vérifier l'autorisation de localisation autorisée
  checkLocationPermissionAlowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  // Recuperer la position exacte du driver
   locateDriverPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    driverCurrentPosition = cPosition;

    LatLng latLngPosition = LatLng(driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLngPosition, zoom: 15);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String humanReadableAdress = await AssistanceMethode.searchAddressForGeographieCoordonnee(driverCurrentPosition!, context);
    print("votre adresse: " + humanReadableAdress);

  }
  // lire les informations actuelles sur le conducteur
  readCurrentDriverInformation(){
    currentUser = firebaseAuth.currentUser;

    FirebaseDatabase.instance.ref()
      .child("drivers")
      .child(currentUser!.uid)
      .once().then((snap) {

        if(snap.snapshot.value != null){
          onlineDriverData.id = (snap.snapshot.value as Map)["id"];
          onlineDriverData.nom = (snap.snapshot.value as Map)["nom"];
          onlineDriverData.prenom = (snap.snapshot.value as Map)["prenom"];
          onlineDriverData.numero = (snap.snapshot.value as Map)["numero"];
          onlineDriverData.email = (snap.snapshot.value as Map)["email"];
          onlineDriverData.model = (snap.snapshot.value as Map)["details_car"]["model"];
          onlineDriverData.matricul = (snap.snapshot.value as Map)["details_car"]["matricul"];
          onlineDriverData.carteGrise = (snap.snapshot.value as Map)["details_car"]["carteGrise"];
          onlineDriverData.vignette = (snap.snapshot.value as Map)["details_car"]["vignette"];
          onlineDriverData.assurence = (snap.snapshot.value as Map)["details_car"]["assurence"];

          driverVehiculeType = (snap.snapshot.value as Map)["details_car"]["type"];
        }
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocationPermissionAlowed();
  }

// ===========================================================================
  // LatLng? pickLocation;
  // loc.Location location = loc.Location();
  // String? _address;

  // GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // Position? userCurrentPosition;

  // String userName = "";
  // String userEmail = "";

  // var geoLocation = Geolocator();

 
  // double bottomPaddingOfMap = 0;

  // List<LatLng> pLineCoordinatedList = [];
  // Set<Polyline> polylineSet = {};

  // Set<Marker> markersSet = {};
  // Set<Circle> circlesSet = {};

  // bool darkTheme = false;

  

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // key: _scaffoldState,
        body: Stack(
          children: [
            GoogleMap(
              // padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              initialCameraPosition: _kGooglePlex,
              // polylines: polylineSet,
              // markers: markersSet,
              // circles: circlesSet,
              onMapCreated: (GoogleMapController controller) {
                _googleMapController.complete(controller);
                newGoogleMapController = controller;

                locateDriverPosition();

                setState(() {
                  // bottomPaddingOfMap = 200;
                });
              },

            ),
          ],
        ),
      ),
    );
  }
}
