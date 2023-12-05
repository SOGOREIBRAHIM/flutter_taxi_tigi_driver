import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:flutter_taxi_tigi_driver/pages/passwordForget.dart';
import 'package:flutter_taxi_tigi_driver/pages/sign.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  void _submit() async {
  if (_formKey.currentState!.validate()) {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailControler.text.trim(),
            password: passControler.text.trim())
        .then((auth) async {
          
       DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child("drivers");
        userRef.child(firebaseAuth.currentUser!.uid).once().then((value) async{
          final snap = value.snapshot;
          if (snap.value != null) {
            // L'utilisateur a un compte, vérifiez maintenant le statut
            Map<dynamic, dynamic>? userData = snap.value as Map<dynamic, dynamic>?;

            if (userData != null) {
              dynamic activeValue = userData["active"];

              if (activeValue is bool) {
                bool isActive = activeValue;

                if (isActive) {
                  // L'utilisateur est activé, connectez-le
                  currentUser = auth.user;
                  await Fluttertoast.showToast(msg: "Connexion réussie");
                  Navigator.push(context, MaterialPageRoute(builder: (index) => accueil()));
                } else {
                  // L'utilisateur est désactivé
                  await Fluttertoast.showToast(msg: "Votre compte est désactivé.");
                  firebaseAuth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (index) => Connexion()));
                }
              } else {
                // La clé "active" n'est pas de type booléen
                print("Erreur : le statut 'active' n'est pas de type booléen");
                Fluttertoast.showToast(msg: "Erreur de connexion");
              }
            } else {
              // Le snapshot ne contient pas de données utilisateur
              await Fluttertoast.showToast(msg: "Vous n'avez pas de compte !");
              firebaseAuth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (index) => Connexion()));
            }
          }
        });
    }).catchError((errorMessage){
      Fluttertoast.showToast(msg: "Connexion échouée");
    });
  }
  else{
    Fluttertoast.showToast(msg: "Remplissez les champs vides");
  }
}


  void _submit1() async {
  if (_formKey.currentState!.validate()) {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailControler.text.trim(),
        password: passControler.text.trim(),
      );

      // Vérifier le statut du conducteur après la connexion
      await checkDriverStatus(userCredential.user!.uid);

      // Si le statut est vérifié et le conducteur est activé
      currentUser = userCredential.user;
      await Fluttertoast.showToast(msg: "Connexion réussie");
      Navigator.push(context, MaterialPageRoute(builder: (index) => accueil()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('Identifiants invalides');
        Fluttertoast.showToast(msg: "Identifiants invalides");
      } else if (e.code == 'user-disabled') {
        print('Le conducteur est désactivé. Impossible de se connecter.');
        Fluttertoast.showToast(msg: "Le conducteur est désactivé. Impossible de se connecter.");
        firebaseAuth.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (index) => Connexion()));
      } else {
        print(e.message);
        Fluttertoast.showToast(msg: "Connexion échouée");
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: "Connexion échouée");
    }
  } else {
    Fluttertoast.showToast(msg: "Remplissez les champs vides");
  }
}

Future<void> checkDriverStatus(String driverId) async {
  DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers").child(driverId);

  DataSnapshot snapshot = (await driversRef.once()) as DataSnapshot;

  if (snapshot.value != null && snapshot.value is Map) {
    Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

    if (data != null) {
      dynamic activeValue = data["active"];
      
      if (activeValue is bool) {
        bool isActive = activeValue;

        if (!isActive) {
          throw FirebaseAuthException(
            code: 'user-disabled',
            message: 'Le conducteur est désactivé. Impossible de se connecter.',
          );
        }
      }
    }
  }
}





  
  final emailControler = TextEditingController();
  final passControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passToggle = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: MesCouleur().couleurPrincipal,
            ),
            child: Column(
              children: [
                Image.asset("assets/images/1.png", height: 200,),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(100))),
                      child: Column(
                        children: [
                          SizedBox(height: 50,),
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
                                      // return null;
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
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    width: 350,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _submit();
                                      },
                                      style: ElevatedButton.styleFrom(
                                    backgroundColor: MesCouleur().couleurPrincipal// Définir la couleur du bouton
                                    // Vous pouvez également personnaliser d'autres propriétés ici
                                  ),
                                      child: Text(
                                        'Se connecter',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20,),
                                  GestureDetector(
                                onTap: () {
                                  // Redirection vers la page d'inscription
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PasswordForget() ),
                                  );
                                },
                                child: const Text(
                                  "Mot de passe oublié",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFEDB602),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                                ]),
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
                                "Vous n'avez pas de compte ?",
                                style: TextStyle(fontSize: 13),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Redirection vers la page d'inscription
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inscription() ),
                                  );
                                },
                                child: const Text(
                                  "S'\inscrire",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFEDB602),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 35,)
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
