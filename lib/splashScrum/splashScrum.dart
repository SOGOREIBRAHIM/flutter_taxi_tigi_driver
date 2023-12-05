import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/assistance/assistanceMethode.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/login.dart';

class Slapsh extends StatefulWidget {
  const Slapsh({super.key});

  @override
  State<Slapsh> createState() => _SlapshState();
}

class _SlapshState extends State<Slapsh> {

  startTime(){
    Timer(Duration(seconds:5), () async {
      if (await firebaseAuth.currentUser != null) {
        print(firebaseAuth.currentUser.toString());
        AssistanceMethode.readCurrentOnlineInfo();
        Navigator.push(context, MaterialPageRoute(builder: ((context) => accueil())));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: ((context) => Connexion())));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
          child: Image.asset(
        "assets/images/driving.png",
        height: MediaQuery.sizeOf(context).height,
      )),
    );
  }
}
