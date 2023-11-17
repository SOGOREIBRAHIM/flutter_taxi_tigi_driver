import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EnregistrerVehicule extends StatefulWidget {
  EnregistrerVehicule({super.key});

  @override
  State<EnregistrerVehicule> createState() => _EnregistrerVehiculeState();
}

class _EnregistrerVehiculeState extends State<EnregistrerVehicule> {
  final matriculeController = TextEditingController();
  final carteGriseController = TextEditingController();
  final modelController = TextEditingController();
  final VignetteController = TextEditingController();
  final AssuranceController = TextEditingController();

  List<String> typeVehicule = ["Prenium", "Economique", "Moto"];
  String? selectionner;

  final _formKey = GlobalKey<FormState>();

  // fonction de verification et enregistrement
  _submit() {
    if (_formKey.currentState!.validate()) {
      Map driversCarInfoMap = {
        "matricule": matriculeController.text.trim(),
        "carteGrise": carteGriseController.text.trim(),
        "model": modelController.text.trim(),
        "vignette": VignetteController.text.trim(),
        "assurance": AssuranceController.text.trim(),
      };
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child("drivers");
      userRef
          .child(currentUser!.uid)
          .child("details_car")
          .set(driversCarInfoMap);

      Fluttertoast.showToast(msg: "Enregistrement terminé \n Vous seriez contacter pour la confirmation");
      Navigator.push(context, MaterialPageRoute(builder: (index) => accueil()));
    } else {
      Fluttertoast.showToast(msg: "Enregistrement");
      Navigator.push(
          context, MaterialPageRoute(builder: (index) => Connexion()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Connexion",
              style: TextStyle(
                color: MesCouleur().couleurPrincipal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFEDB602),
                size: 30,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: MesCouleur().couleurPrincipal,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/1.png",
                  height: 200,
                ),
                Column(
                  children: [
                    Container(
                      // height: MediaQuery.sizeOf(context).height,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        labelText: "Model du vehicule",
                                        prefixIcon: Icon(
                                            FontAwesomeIcons.driversLicense,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Model du vehicule ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "Model du vehicule trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "Model du vehicule trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      modelController.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        labelText: "Numero de matricule",
                                        prefixIcon: Icon(
                                            FontAwesomeIcons.driversLicense,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Matricule ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "Matricule trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "Matricule trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      matriculeController.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        labelText: "Numero de carte grise",
                                        prefixIcon: Icon(
                                            FontAwesomeIcons.driversLicense,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Matricule ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "Matricule trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "Matricule trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      carteGriseController.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        labelText: "Numero de vignette",
                                        prefixIcon: Icon(
                                            FontAwesomeIcons.driversLicense,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "vignette ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "vignette trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "vignette trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      VignetteController.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        labelText: "Numero d'assurance",
                                        prefixIcon: Icon(
                                            FontAwesomeIcons.driversLicense,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Assurance ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "Assurance trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "Assurance trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      AssuranceController.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          hintText: "Selectioner un vehicule",
                                          prefixIcon: Icon(
                                              FontAwesomeIcons.carRear,
                                              color: Color(0xFFEDB602)),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black45,
                                                // style: BorderStyle.none,
                                              ))),
                                      items: typeVehicule.map((car) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            car,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          value: car,
                                        );
                                      }).toList(),
                                      onChanged: (valeur) {
                                        setState(() {
                                          selectionner = valeur.toString();
                                        });
                                      }),
                                  SizedBox(height: 15),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    width: 350,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _submit();
                                      },
                                      child: Text(
                                        'Confirmer',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
