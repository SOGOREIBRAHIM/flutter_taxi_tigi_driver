import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnnulerReservation extends StatefulWidget {
  const AnnulerReservation({super.key});

  @override
  State<AnnulerReservation> createState() => _AnnulerReservationState();
}

class _AnnulerReservationState extends State<AnnulerReservation> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Annuler reservation",
          style: TextStyle(color: Color(0xFFEDB602)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => accueil()),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Color(0xFFEDB602),
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(""),
          ],
        ),
      ),
    );
  }
}