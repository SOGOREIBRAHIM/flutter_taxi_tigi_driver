import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/infoChauff.dart';


class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text(
          "Confirmer votre reservation",
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
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/30.png"),
              height: 345,
              width: 860,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFEDB602),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Container(
                        height: 250,
                        margin: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/moto-.png"),
                                    height: 90,
                                    width: 100,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 105, top: 10),
                                      child: Text(
                                        "Moto",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Text("8 minute de votre position"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Divider(
                                color: Color.fromARGB(
                                    255, 119, 119, 119), // Couleur de la ligne
                                height:
                                    10, // Hauteur de l'espace au-dessus et au-dessous de la ligne
                                thickness: 2, // Épaisseur de la ligne
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Espece"),
                                  Text("2000 FCFA"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Depart"),
                                  Text("Amdallaye ACI 2000"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Destination"),
                                  Text("Magnambougou"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        child: Text(
                          'CONFIRMER',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFEDB602),
                            padding: EdgeInsets.fromLTRB(90, 15, 90, 15),
                            minimumSize: Size(360, 20),
                            shadowColor: Color.fromARGB(255, 56, 56, 56)),
                        onPressed: () {
                          _showMyDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image(image: AssetImage("assets/icons/valide.png")),
              Text(
                'Reservation effectuée !',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Votre code',
                textAlign: TextAlign.center,
              ),
              Text(
                '4398',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFEDB602),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Quitter'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoChauff()),
              );
            },
          ),
        ],
      );
    },
  );
}
