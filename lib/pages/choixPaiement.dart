import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/infoChauff.dart';

class ChoixPaiement extends StatefulWidget {
  const ChoixPaiement({super.key});

  @override
  State<ChoixPaiement> createState() => _ChoixPaiementState();
}

class _ChoixPaiementState extends State<ChoixPaiement> {
  List<int> elements = [1, 2, 3];
  int? elementSelectionne;

  List imgData = [
    "assets/images/oms.png",
    "assets/images/money1.png",
  ];

  List<String> titre = [
    "Orange Money",
    "Espèce",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Mode de paiement",
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
            Image(
              image: AssetImage("assets/images/37.png"),
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
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 0,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  elementSelectionne = elements[index];
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 40, left: 20, right: 20),
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
                                      titre[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
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
                                builder: (context) => InfoChauff()),
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
