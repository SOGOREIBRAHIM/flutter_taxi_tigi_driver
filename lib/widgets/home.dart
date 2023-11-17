import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/Profil.dart';
import 'package:flutter_taxi_tigi_driver/pages/devenirChauffeur.dart';
import 'package:flutter_taxi_tigi_driver/pages/paiement.dart';
import 'package:flutter_taxi_tigi_driver/pages/trajet.dart';
import 'package:flutter_taxi_tigi_driver/splashScrum/splashScrum.dart';
import 'package:flutter_taxi_tigi_driver/widgets/maps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexCourant = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List pages = [
    DevenirChauffeur(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Color(0xFFEDB602),

      ),
      body: Stack(
        children: [
           Maps(),
        ],
      ),
   );
  }
}


