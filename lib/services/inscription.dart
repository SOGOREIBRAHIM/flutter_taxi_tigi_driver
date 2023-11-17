// import 'package:flutter/material.dart';
// import 'package:flutter_taxi_tigui/global/global.dart';

// class Inscription {
//    void _submit() async {
//     if (formKey.currentState!.validate()) {
//       await firebaseAuth
//           .createUserWithEmailAndPassword(
//               email: emailControler.text.trim(),
//               password: passControler.text.trim())
//           .then((auth) async {
//         currentUser = auth.user;
//         if (currentUser != null) {
//           Map userMap = {
//             "id": currentUser!.uid,
//             "nom": nomControler.text.trim(),
//             "prenom": prenomControler.text.trim(),
//             "numero": numControler.text.trim(),
//             "email": emailControler.text.trim(),
//             "mot de passe": passControler.text.trim(),
//             "confirmer": confirmerPassControler.text.trim(),
//           };
//           DatabaseReference userRef =
//               FirebaseDatabase.instance.ref().child("users");
//           userRef.child(currentUser!.uid).set(userMap);
//         }
//         await Fluttertoast.showToast(msg: "Inscription reussit");
//         Navigator.push(
//             context, MaterialPageRoute(builder: (index) => Connexion()));
//       }).catchError((errorMessage){
//         Fluttertoast.showToast(msg: "Inscription echoué \n $errorMessage");
//       });
//     }
//     else{
//       Fluttertoast.showToast(msg: "Tous les champs ne sont pas remplis");
//     }
//   }
// }