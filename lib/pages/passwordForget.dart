import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordForget extends StatefulWidget {
  const PasswordForget({super.key});

  @override
  State<PasswordForget> createState() => _PasswordForgetState();
}

class _PasswordForgetState extends State<PasswordForget> {

  final emailControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit(){
    firebaseAuth.sendPasswordResetEmail(email: emailControler.text.trim()
    ).then((value) {
      Fluttertoast.showToast(msg: "nous vous avons envoyé un e-mail pour récupérer, veuillez vérifier vos e-mails");
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "erreur est survenue");
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Mot de passe oublié",
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(50),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(70))),
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
                                      },
                                      onChanged: (text) => setState(() {
                                        emailControler.text = text;
                                      }),
                                    ),
                                    SizedBox(height: 10),
                                    
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
                                          'Lien de réinitialisation envoyé',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20,),
                                    
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
                             Row(
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
                                 SizedBox(height: 65,)
                               ],
                             ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}