

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/NewTripInterface.dart';
import 'package:flutter_taxi_tigi_driver/assistance/assistanceMethode.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/models/userRideRequestInf.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotifacationDialogBox extends StatefulWidget {

  // NotifacationDialogBox({super.key, required UserRideRequestInfo userRideRequestDetails});

  UserRideRequestInfo? userRideRequestDetails;

  NotifacationDialogBox({super.key, this.userRideRequestDetails});

  @override
  State<NotifacationDialogBox> createState() => _NotifacationDialogBoxState();
}

class _NotifacationDialogBoxState extends State<NotifacationDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/RAV.png",
            ),
            SizedBox(height: 8,),
            Text(
              "Demander nouveau trajet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: MesCouleur().couleurPrincipal),
            ),
            SizedBox(height: 14,),
            Divider(
              height: 2,
              thickness: 2,
              color: MesCouleur().couleurPrincipal,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/RAV.png",
                       height: 30,
                       width: 30,),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          child: Text(
                            widget.userRideRequestDetails!.originAdress!,
                            style: TextStyle(fontSize: 16, color: MesCouleur().couleurPrincipal),
                          ),
                      ),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset("assets/images/RAV.png",
                        height: 30,
                        width: 20,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Text(
                      widget.userRideRequestDetails!.destinationAdress!,
                      style: TextStyle(fontSize: 16, color: MesCouleur().couleurPrincipal),
                    ))
                    ],
                  ),
                ],
              ),
              ),
            Divider(
              thickness: 2,
              height: 2,
              color: MesCouleur().couleurPrincipal
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      audioPlayer.pause();
                      audioPlayer.stop();
                      audioPlayer = AssetsAudioPlayer();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red
                    ),
                    child:Text(
                      "Annuler".toUpperCase(),
                      style: TextStyle(fontSize: 15),
                    ) 
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                    onPressed: () {
                      audioPlayer.pause();
                      audioPlayer.stop();
                      audioPlayer = AssetsAudioPlayer();
                      accepteRideRequest(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue
                    ),
                    child:Text(
                      "Accepter".toUpperCase(),
                      style: TextStyle(fontSize: 15),
                    ) 
                    ),
                ],
              ),
              )
          ],
        ),
      ),
    );
  }

  accepteRideRequest(BuildContext context){
    FirebaseDatabase.instance.ref().child("drivers").child(firebaseAuth.currentUser!.uid).child("newRideStatus").once().then((snap) {
      if (snap.snapshot.value == "Idle") {
        FirebaseDatabase.instance.ref().child("drivers").child(firebaseAuth.currentUser!.uid).child("newRideStatus").set("accepted");

        AssistanceMethode.pauseLiveLocationUpdate();

        // le trajet a commencé maintenant - envoyer le conducteur vers le nouveau interface tajet
        Navigator.push(context, MaterialPageRoute(builder: (c)=> NewTripInterface()));
      }
      else{
        Fluttertoast.showToast(msg: "Cet demande de trajet n'existe pas");
      }
    });
  }

  
}





