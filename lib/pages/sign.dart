import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/enregistrerVehicule.dart';
import 'package:flutter_taxi_tigi_driver/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  // fonction de verification et enregistrement
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailControler.text.trim(),
              password: passControler.text.trim())
          .then((auth) async {
        currentUser = auth.user;
        if (currentUser != null) {
          Map userMap = {
            "id": currentUser!.uid,
            "nom": nomControler.text.trim(),
            "prenom": prenomControler.text.trim(),
            "numero": numControler.text.trim(),
            "email": emailControler.text.trim(),
            "mot de passe": passControler.text.trim(),
            "confirmer": confirmerPassControler.text.trim(),
          };
          DatabaseReference userRef =
              FirebaseDatabase.instance.ref().child("drivers");
          userRef.child(currentUser!.uid).set(userMap);
        }
        await Fluttertoast.showToast(msg: "Enregistrer le vehicule");
        Navigator.push(
            context, MaterialPageRoute(builder: (index) => EnregistrerVehicule()));
      }).catchError((errorMessage){
        Fluttertoast.showToast(msg: "Enregistrer echoué !");
      });
    }
    else{
      Fluttertoast.showToast(msg: "Remplisser les champs vides !");
    }
  }

  final emailControler = TextEditingController();
  final passControler = TextEditingController();
  final confirmerPassControler = TextEditingController();
  final numControler = TextEditingController();
  final nomControler = TextEditingController();
  final prenomControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  bool confirmPassToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text(
            "INSCRIPTION",
            style: TextStyle(
                color: MesCouleur().couleurPrincipal,
                fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: MesCouleur().couleurPrincipal,
            ),
            child: Column(
              children: [
                Image.asset("assets/images/3.png"),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70))),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(
                                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                                        ),
                                        labelText: "Nom",
                                        prefixIcon: Icon(Icons.person_2_outlined,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Nom ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "Nom trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "Nom trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      nomControler.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(
                                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                                        ),
                                        labelText: "Prenom",
                                        prefixIcon: Icon(Icons.person_2_outlined,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Prenom ne peut pas etre vide !";
                                      }
                                      if (text.length < 2) {
                                        return "Prenom trop court !";
                                      }
                                      if (text.length > 60) {
                                        return "Prenom trop long, Maximuin 30 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      prenomControler.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  IntlPhoneField(
                                    showCountryFlag: true,
                                    dropdownIcon: Icon(
                                      Icons.arrow_drop_down,
                                      color: MesCouleur().couleurPrincipal,
                                    ),
                                    decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(
                                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                                        ),
                                        border: OutlineInputBorder()),
                                    initialCountryCode: 'ML',
                                    onChanged: (text) => setState(() {
                                      numControler.text = text.completeNumber;
                                    }),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(
                                                  0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                                        ),
                                        labelText: "Email",
                                        prefixIcon: Icon(Icons.email_outlined,
                                            color: Color(0xFFEDB602)),
                                        border: OutlineInputBorder()),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Email ne peut pas etre vide !";
                                      }
                                      if (EmailValidator.validate(text)) {
                                        return null;
                                      }
                                      if (text.length < 2) {
                                        return "Email trop court !";
                                      }
                                      if (text.length > 100) {
                                        return "Nom trop long, Maximuin 50 !";
                                      }
                                    },
                                    onChanged: (text) => setState(() {
                                      emailControler.text = text;
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(20)
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Mot de passe ne peut pas etre vide !";
                                      }
                                      if (text.length < 5) {
                                        return "Entrez mot de passe valide !";
                                      }
                                      if (text.length > 19) {
                                        return "Mot de passe trop long, Maximuin 19 !";
                                      }
                                      return null;
                                    },
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
                                          Icons.lock_outline,
                                          color: Color(0xFFEDB602),
                                        ),
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              passToggle = !passToggle;
                                            });
                                          },
                                          child: Icon(
                                            passToggle
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Color(0xFFEDB602),
                                          ),
                                        ),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(20)
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Confirmer mot de passe ne peut pas etre vide !";
                                      }
                                      if (text.length < 5) {
                                        return "Entrez mot de passe valide !";
                                      }
                                      if (text != passControler.text) {
                                        return "Mot de passe incorrect !";
                                      }
                                      if (text.length > 19) {
                                        return "Confirmer Mot de passe trop long, Maximuin 19 !";
                                      }
                                      return null;
                                    },
                                    obscureText: confirmPassToggle,
                                    controller: confirmerPassControler,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(
                                                  0xFFEDB602)),
                                        ),
                                        labelText: "Confirmer ",
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Color(0xFFEDB602),
                                        ),
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              confirmPassToggle = !confirmPassToggle;
                                            });
                                          },
                                          child: Icon(
                                            passToggle
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Color(0xFFEDB602),
                                          ),
                                        ),
                                        border: OutlineInputBorder()),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    width: 350,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _submit();
                                      },
                                      child: Text(
                                        'Continuer',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),

                          SizedBox(height: 20),
                           Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Vous avez déjà un compte ?",
                                style: TextStyle(fontSize: 13),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Redirection vers la page d'inscription
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Connexion()),
                                  );
                                },
                                child: const Text(
                                  "Se connecter",
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
