import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';

class Revenu extends StatefulWidget {
  const Revenu({super.key});

  @override
  State<Revenu> createState() => _RevenuState();
}

class _RevenuState extends State<Revenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Revenu",
          style:
              TextStyle(color: Color(0xFFEDB602), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => accueil()),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Color(0xFFEDB602),
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 400,
            height: 600,
            decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 107, 105, 105),
                        spreadRadius: 1,
                        blurRadius: 5
                      )
                    ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Calcul du revenu",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextFormField(
                      // controller: _controleurMontant,
                      decoration: const InputDecoration(
                        suffix: Text("FCFA"),
                        prefixIcon: ImageIcon(
                          AssetImage("assets/images/cash2.png"),
                          color: Color(0xFFEDB602),
                          size: 20,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Montant du trajet',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextFormField(
                      // controller: _controleurMontant,
                      decoration: const InputDecoration(
                        suffix: Text("FCFA"),
                        prefixIcon: ImageIcon(
                          AssetImage("assets/images/cash2.png"),
                          color: Color(0xFFEDB602),
                          size: 20,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Montant de taxiTigui',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextFormField(
                      // controller: _controleurMontant,
                      decoration: const InputDecoration(
                        suffix: Text("FCFA"),
                        prefixIcon: ImageIcon(
                          AssetImage("assets/images/cash2.png"),
                          color: Color(0xFFEDB602),
                          size: 20,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Montant du chauffeur',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Revenu())));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green, // Définir la couleur du bouton
                        // Vous pouvez également personnaliser d'autres propriétés ici
                      ),
                      child: Text(
                        "Calculer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
