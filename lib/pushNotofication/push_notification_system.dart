

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/models/userRideRequestInf.dart';
import 'package:flutter_taxi_tigi_driver/pushNotofication/notification_dialig_box.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initializeCloudMessaging(BuildContext context) async{
    // Terminer
    // lorsque l'application est fermée et ouverte directement depuis la notification push
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage){
      if (remoteMessage != null) {
        // lire les informations sur la demande de trajet de l'utilisateur
        readUserRideRequestInfo(remoteMessage.data["rideRequestId"], context);
      }
    });
    // premier plan
    // lorsque l'application est ouverte et reçoit la notification push
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) { 
      readUserRideRequestInfo(remoteMessage!.data["rideRequestId"], context);
    });

    // Backgroung
    // lorsque l'application est en arrière-plan et ouverte directement depuis les informations push
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) { 
      readUserRideRequestInfo(remoteMessage!.data["rideRequestId"], context);
    });
  } 

  // lire les informations sur la demande de trajet de l'utilisateur
      readUserRideRequestInfo(String userRideRequestId, BuildContext context){
        FirebaseDatabase.instance.ref().child("All Ride Requests").child("driverId").onValue.listen((event) {
          if (event.snapshot.value == "waiting" || event.snapshot.value == firebaseAuth.currentUser!.uid) {
            FirebaseDatabase.instance.ref().child("All Ride Requests").child(userRideRequestId).once().then((snapData) {
              if(snapData.snapshot.value != null){
                audioPlayer.open(Audio("music/music_notification.mp3"));
                audioPlayer.play();

                double originLat = double.parse((snapData.snapshot.value! as Map)["origin"]["latitude"]);
                double originLong = double.parse((snapData.snapshot.value! as Map)["origin"]["longitude"]);
                double originAddress = (snapData.snapshot.value! as Map)["originAdress"];

                double destinationLat = double.parse((snapData.snapshot.value! as Map)["destination"]["latitude"]);
                double destinationLong = double.parse((snapData.snapshot.value! as Map)["destination"]["longitude"]);
                double destinationAddress = (snapData.snapshot.value! as Map)["destinationAdress"];

                String username = (snapData.snapshot.value as Map)["username"];
                String userPhone = (snapData.snapshot.value as Map)["userPhone"];

                String? rideRequestId = snapData.snapshot.key;

                UserRideRequestInfo userRideRequestDetails = UserRideRequestInfo();
                userRideRequestDetails.originLatLng = LatLng(originLat, originLong);
                userRideRequestDetails.originAddress = originAddress as String?;
                userRideRequestDetails.destinationLatLng = LatLng(destinationLat, destinationLong);
                userRideRequestDetails.destinationAddress = destinationAddress as String?;
                userRideRequestDetails.username = username;
                userRideRequestDetails.userPhone = userPhone;

                userRideRequestDetails.rideRequestId = rideRequestId;

                showDialog(
                  context: context, 
                  builder: (BuildContext context)=> NotifacationDialogBox(
                    userRideRequestDetails: userRideRequestDetails,
                  ) );
              }
              else{
                Fluttertoast.showToast(msg: "Cette reservation n'existe pas");
              }
            });
          }
          else{
            Fluttertoast.showToast(msg: "Cette notification a ete annulé");
            Navigator.pop(context);
          }
        });
      } 

      // Obtenir le token FCM
      Future generateAndGetToken() async {
        String? registrationToken = await messaging.getToken();
        print("FCM registrationToken token ${registrationToken}");

      // Définir le token FCM dans la base de données en temps réel Firebase
        FirebaseDatabase.instance
          .ref()
          .child("drivers")
          .child(firebaseAuth.currentUser!.uid)
          .child("token")
          .set(registrationToken);

        // S'abonner à un sujet
        await messaging.subscribeToTopic("allDrivers");
        await messaging.subscribeToTopic("allUser");
      } 
}