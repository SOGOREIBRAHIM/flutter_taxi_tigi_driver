import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_taxi_tigi_driver/assistance/assistanceMethode.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/vehicule.dart';
import 'package:flutter_taxi_tigi_driver/pushNotofication/push_notification_system.dart';
import 'package:flutter_taxi_tigi_driver/widgets/progressDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    driverCurrentPosition = cPosition;

    LatLng latLngPosition = LatLng(
        driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 15);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String humanReadableAdress =
        await AssistanceMethode.searchAddressForGeographieCoordonnee(
            driverCurrentPosition!, context);
    print("votre adresse: " + humanReadableAdress);
  }

  // lire les informations actuelles sur le conducteur
  readCurrentDriverInformation() {
    currentUser = firebaseAuth.currentUser;

    FirebaseDatabase.instance
        .ref()
        .child("drivers")
        .child(currentUser!.uid)
        .once()
        .then((snap) {
      if (snap.snapshot.value != null) {
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
        onlineDriverData.car_type = (snap.snapshot.value as Map)["details_car"]["type"];

        driverVehiculeType = (snap.snapshot.value as Map)["details_car"]["type"];
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocationPermissionAlowed();
    readCurrentDriverInformation();

    PushNotificationSystem pushNotificationSystem = PushNotificationSystem();
    pushNotificationSystem.initializeCloudMessaging(context);
    pushNotificationSystem.generateAndGetToken();

  }


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

            statusText != "Activation"
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    color: Colors.black87,
                  )
                : Container(),

            // button activer et desactiver
            Positioned(
                top: statusText != "Activation" ? MediaQuery.of(context).size.height * 0.40 : 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (isDriverActive != true) {
                            driverOnlineNow();
                            updateDriverLocationRealTime();

                            setState(() {
                              statusText = "Activation";
                              isDriverActive = true;
                              buttonColor = Colors.transparent;
                            });
                            Fluttertoast.showToast(msg: "Vous etes connecté !");
                          } else {
                            driverOffLineNow();
                            setState(() {
                              statusText = "Desactiver";
                              isDriverActive = false;
                              buttonColor = Colors.grey;
                            });
                            Fluttertoast.showToast(
                                msg: "Vous etes déconnecté !");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: buttonColor,
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                                )
                                ),
                            child: statusText != "Activation" ? 
                              Text( "Activation",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                )
                            : Icon(
                                Icons.phonelink_ring,
                                color: Colors.white,
                                size: 40,)
                                ),
                  ],
                ))
          ],
        ),
      ),
    );
  }


      // chauffeur activer
      driverOnlineNow() async{
        Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
        );

        driverCurrentPosition = pos;

        Geofire.initialize("activeDrivers");
        Geofire.setLocation(currentUser!.uid, driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

        DatabaseReference ref = FirebaseDatabase.instance.ref().child("drivers").child(currentUser!.uid).child("newRideStatus");
        ref.set("idle");
        ref.onValue.listen((event) {});
      }

      // mise de la postion actuelle du chauffeur
      updateDriverLocationRealTime(){
        streamSubscriptionPosition = Geolocator.getPositionStream().listen((Position position) {
          if (isDriverActive == true) {
            Geofire.setLocation(currentUser!.uid, driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);
          }
          LatLng latLng = LatLng(driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

          newGoogleMapController!.animateCamera(CameraUpdate.newLatLng(latLng));
        });
      }


      driverOffLineNow(){
        Geofire.removeLocation(currentUser!.uid);

        DatabaseReference? ref = FirebaseDatabase.instance.ref().child("drivers").child(currentUser!.uid).child("newRideStatus");
        ref.onDisconnect();
        ref.remove();
        ref = null;

        Future.delayed(Duration(milliseconds: 2000), (){
          Navigator.push(context, MaterialPageRoute(builder: (c) => accueil(),));
        });
      }

}
