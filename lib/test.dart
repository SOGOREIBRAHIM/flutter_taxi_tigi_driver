import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/sign.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formField = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passControler = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "Connexion",
              style: TextStyle(
                color: Color(0xFFEDB602),
              ),
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Color(0xFFEDB602),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/3.png",
                  width: 340,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    key: _formField,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70))),
                      padding:
                          const EdgeInsets.only(top: 50, left: 30, right: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          TextFormField(
                            controller: emailControler,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFEDB602)),
                              ),
                              labelText: "Email",
                              prefixIcon:
                                  Icon(Icons.email, color: Color(0xFFEDB602)),
                              border: OutlineInputBorder(
                                  // borderSide:
                                  //     BorderSide(color: Color(0xFFEDB602)),
                                  ),
                            ),
                          ),
                          SizedBox(height: 25),
                          TextFormField(
                            validator: (value){},
                            obscureText: passToggle,
                            controller: passControler,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                                ),
                                labelText: "Mot de passe",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.lock,
                                  color: Color(0xFFEDB602),
                                ),
                                suffix: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(passToggle ? Icons.visibility : Icons.visibility_off, color: Color(0xFFEDB602), ),
                                ),
                                
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(
                            child: Text('CONNEXION', style: TextStyle(color: MesCouleur().couleurTexteBouton,fontSize: 16,fontWeight: FontWeight.bold),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEDB602),
                              padding: EdgeInsets.only(top: 15, left: 115, right: 115, bottom: 15)
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => accueil()),
                              );
                            },
                          ),
                          SizedBox(height: 30),
                          Image.asset("assets/images/ou.png", width: 340),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/google.png"),
                              Image.asset("assets/images/facebook.png"),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Vous n’avez pas de compte ?",
                                  style: TextStyle(fontSize: 13),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Redirection vers la page d'inscription
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Inscription()),
                                    );
                                  },
                                  child: const Text(
                                    "S’inscrire",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFEDB602),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),
                        ],
                      )),
                ))
              ],
            )));
  }
}
