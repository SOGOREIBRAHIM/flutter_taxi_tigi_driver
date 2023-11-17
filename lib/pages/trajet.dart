import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';

class Trajet extends StatefulWidget {
  const Trajet({super.key});

  @override
  State<Trajet> createState() => _TrajetState();
}

class _TrajetState extends State<Trajet> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Mes trajets",
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
    );
  }
}