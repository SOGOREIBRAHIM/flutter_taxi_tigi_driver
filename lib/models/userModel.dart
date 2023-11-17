
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? id;
  String? nom;
  String? prenom;
  String? phone;
  String? email;


  UserModel({
    this.id,
    this.nom,
    this.prenom,
    this.email,
    this.phone
  });

  UserModel.fromSnapshot(DataSnapshot snap){
    id = snap.key;
    nom = (snap.value as dynamic)["nom"];
    prenom = (snap.value as dynamic)["prenom"];
    email = (snap.value as dynamic)["email"];
    phone = (snap.value as dynamic)["numero"];
  }


}