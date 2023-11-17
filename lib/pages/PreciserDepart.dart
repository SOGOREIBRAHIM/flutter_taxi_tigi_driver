import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/assistance/assistanceMethode.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/infoHandler/app_info.dart';
import 'package:flutter_taxi_tigi_driver/models/direction.dart';
import 'package:flutter_taxi_tigi_driver/pages/APIkey.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';

class PreciserDepart extends StatefulWidget {
  const PreciserDepart({super.key});

  @override
  State<PreciserDepart> createState() => _PreciserDepartState();
}

class _PreciserDepartState extends State<PreciserDepart> {
  final Completer<GoogleMapController> _googleMapController = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.6120094, -8.0146979),
    zoom: 15,
  );

  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? _address;

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  Position? userCurrentPosition;

  double bottomPaddingOfMap = 0;

  locateUserPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    userCurrentPosition = cPosition;

    LatLng latLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 15);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String humanReadableAdress =
        await AssistanceMethode.searchAddressForGeographieCoordonnee(
            userCurrentPosition!, context);
    print("votre adresse: " + humanReadableAdress);

    // initializeGeoFireListener();

    // AssistanceMethode.readCurrentOnlineInfo(context);
  }

  getAddressFromLagLng() async {
    try {
      GeoData data = await Geocoder2.getDataFromCoordinates(
          latitude: pickLocation!.latitude,
          longitude: pickLocation!.longitude,
          googleMapApiKey: apiKey);

      setState(() {
        Direction userPickUpAddress = Direction();
        userPickUpAddress.locationLagitude = pickLocation!.latitude;
        userPickUpAddress.locationLongitude = pickLocation!.longitude;
        userPickUpAddress.locationName = data.address;
        // _address = data.address;
        // print("Recuperer adresse =>#################################################################");
        //  print(locationName);
        // print(_address);
        Provider.of<AppInfo>(context, listen: false)
            .updatePickupLocationAdress(userPickUpAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(top: 100,bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _googleMapController.complete(controller);
              newGoogleMapController = controller;

              setState(() {
                bottomPaddingOfMap = 50;
              });

              locateUserPosition();
            },
            onCameraMove: (CameraPosition? position) {
              if (pickLocation != position!.target) {
                setState(() {
                  pickLocation = position.target;
                });
              }
            },
            onCameraIdle: () {
              getAddressFromLagLng();
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 60,bottom: bottomPaddingOfMap),
              child: Icon(
                Icons.location_on,
                color: MesCouleur().couleurPrincipal,size: 50,
              ),
            ),
          ),

          Positioned(
              top: 40,
              right: 20,
              left: 20,
                child: Container(
              decoration:
                  BoxDecoration(
                  border: Border.all(color: MesCouleur().couleurPrincipal),
                  color: Colors.white
                  ),
                  padding: EdgeInsets.all(20),
                child: Text(
                  Provider.of<AppInfo>(context).userPickeUpLocation !=null
                  ? Provider.of<AppInfo>(context).userPickeUpLocation!.locationName!
                  : "Address",
                  overflow: TextOverflow.visible, softWrap: true,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Définir l'emplacement actuel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
