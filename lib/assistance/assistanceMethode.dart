

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_taxi_tigi_driver/assistance/requsetAssistant.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/infoHandler/app_info.dart';
import 'package:flutter_taxi_tigi_driver/models/direction.dart';
import 'package:flutter_taxi_tigi_driver/models/directionDetailsInfo.dart';
import 'package:flutter_taxi_tigi_driver/models/userModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class AssistanceMethode {
  

  // Lire l'utilisateur actuel en ligne
  static void readCurrentOnlineInfo(){
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child(currentUser!.uid);
      userRef.once().then((snap) {
        if(snap.snapshot.value != null){
          userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
        }
      });
  }

  static Future<String> searchAddressForGeographieCoordonnee(Position position, context) async{

    var mapKey = "AIzaSyDDGtmVxuMl8rMOacYgbdEfghp2xpOeYQg";

    String apiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    String humanReadableAdress = "";

    var requestResponse = await RequsetAssistant.receiveRequest(apiUrl);

    if(requestResponse != "Error Occured. Failed. No  Response."){
      humanReadableAdress = requestResponse["results"][0]["formatted_address"];

      Direction userPickUpAddress = Direction();
      userPickUpAddress.locationLagitude = position.latitude;
      userPickUpAddress.locationLongitude = position.longitude;
      userPickUpAddress.locationName = humanReadableAdress;
      
      Provider.of<AppInfo>(context, listen: false).updatePickupLocationAdress(userPickUpAddress);
    }

    return humanReadableAdress;

  }

  static Future<DirectionDetailsInfo> obtainOriginToDestinationDirectionDetails(LatLng originPosition, LatLng destinationPosition) async{
    
    var mapKey = "AIzaSyDDGtmVxuMl8rMOacYgbdEfghp2xpOeYQg";

    String urlOriginToDestinationDirectionDetails = "https://maps.googleapis.com/maps/api/directions/json?origin=${originPosition.latitude},${originPosition.longitude}&destination=${destinationPosition.latitude},${destinationPosition.longitude}&key=$mapKey";

    var responseDirectionApi = await RequsetAssistant.receiveRequest(urlOriginToDestinationDirectionDetails);

    // if(responseDirectionApi == "Error Occured. Failed. No  Response.") {
    //   return;
    // }

    DirectionDetailsInfo directionDetailsInfo = DirectionDetailsInfo();
    directionDetailsInfo.e_points = responseDirectionApi["routes"][0]["overview_polyline"]["points"];
    
    directionDetailsInfo.distance_text = responseDirectionApi["routes"][0]["legs"][0]["distance"]["text"];
    directionDetailsInfo.distance_value = responseDirectionApi["routes"][0]["legs"][0]["distance"]["value"];

    directionDetailsInfo.duration_text = responseDirectionApi["routes"][0]["legs"][0]["duration"]["text"];
    directionDetailsInfo.duration_value = responseDirectionApi["routes"][0]["legs"][0]["duration"]["value"];
    
    return directionDetailsInfo;


  }
}