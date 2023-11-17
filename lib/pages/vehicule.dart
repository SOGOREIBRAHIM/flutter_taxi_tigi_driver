import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/choixPaiement.dart';


class Vehicule extends StatefulWidget {
  const Vehicule({super.key});

  @override
  State<Vehicule> createState() => _VehiculeState();
}

class _VehiculeState extends State<Vehicule> {
  List<int> elements = [1, 2, 3];
  int? elementSelectionne;

  List imgData = [
    "assets/images/moto-.png",
    "assets/images/Eco.png",
    "assets/images/HILLUX.png",
  ];

  List etoile = [
    "assets/images/moto.png",
    "assets/images/voitureE.png",
    "assets/images/voitureP.png",
  ];

  List<String> vehicule = [
    "Moto",
    "Economique",
    "Prenium",
  ];

  List<int> prix = [
    20000,
    30000,
    40000,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text(
          "Choisissez votre destination",
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
              image: AssetImage("assets/images/34.png"),
              height: 300,
              width: 700,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  elementSelectionne = elements[index];
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 40, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 139, 139, 139),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      imgData[index],
                                    ),
                                    Text(
                                      vehicule[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Image.asset(etoile[index]),
                                    Text(
                                      prix[index].toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: ElevatedButton(
                        child: Text(
                          'SUIVANT',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoixPaiement()),
                          );
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
