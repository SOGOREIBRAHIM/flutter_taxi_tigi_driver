import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';

class InfoChauff extends StatefulWidget {
  const InfoChauff({super.key});

  @override
  State<InfoChauff> createState() => _InfoChauffState();
}

class _InfoChauffState extends State<InfoChauff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text(
          "Information de votre chauffeur",
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
            Positioned(
              child: Container(
                height: 350,
                decoration: const BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 160,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/1.png"),
                              radius: 50,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Text("Ibrahim SOGORE",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(image: AssetImage("assets/icons/call.png")),
                            Text("Appel")
                          ],
                        ),
                        SizedBox(width: 20, height: 170),
                        Column(
                          children: [
                            Image(
                                image: AssetImage("assets/icons/whatsApp.png")),
                            Text("WhatsApp")
                          ],
                        ),
                        SizedBox(
                          width: 20,
                          height: 170,
                        ),
                        // child: GestureDetector pour action onTap
                        Column(
                          children: [
                            Image(image: AssetImage("assets/icons/chat.png")),
                            Text("Messsage")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Information supplementaire",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Vehiucle"),
                        Text("Moto Yamaya, Bleu"),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Matricule"),
                        Text("CH 9518"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Permis de conduire"),
                        Image(image: AssetImage("assets/icons/check.png")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Divider(
                      color: Color.fromARGB(
                          255, 119, 119, 119), // Couleur de la ligne
                      height:
                          1, // Hauteur de l'espace au-dessus et au-dessous de la ligne
                      thickness: 2, // Épaisseur de la ligne
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Assurance"),
                        Image(image: AssetImage("assets/icons/check.png")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Divider(
                      color: Color.fromARGB(
                          255, 119, 119, 119), // Couleur de la ligne
                      height:
                          1, // Hauteur de l'espace au-dessus et au-dessous de la ligne
                      thickness: 2, // Épaisseur de la ligne
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Vignette"),
                        Image(image: AssetImage("assets/icons/check.png")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Divider(
                      color: Color.fromARGB(
                          255, 119, 119, 119), // Couleur de la ligne
                      height:
                          1, // Hauteur de l'espace au-dessus et au-dessous de la ligne
                      thickness: 2, // Épaisseur de la ligne
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Carte grise"),
                        Image(image: AssetImage("assets/icons/check.png")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Divider(
                      color: Color.fromARGB(
                          255, 119, 119, 119), // Couleur de la ligne
                      height:
                          1, // Hauteur de l'espace au-dessus et au-dessous de la ligne
                      thickness: 2, // Épaisseur de la ligne
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
