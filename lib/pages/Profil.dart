import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  

  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final numeroController = TextEditingController();
  final emailController = TextEditingController();
  // String emailSubString = "";

  DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");

  Future<void> showUserPrenomDialogAlert(BuildContext context, String prenom){

    prenomController.text = prenom;
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenomController.text);
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenom);

    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Modifier"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: prenomController,
                  
                )
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text(
              "Annuler",
              style: TextStyle(
                color: Colors.red,
              ),
            )),

            TextButton(
              onPressed: () {
               userRef.child(firebaseAuth.currentUser!.uid).update({
                "prenom": prenomController.text.trim(),
               }).then((value) {
                prenomController.clear();
                Fluttertoast.showToast(msg: prenomController.text+" modifié avec succè");
               }).catchError((errorMessage){
                Fluttertoast.showToast(msg: prenomController.text+" modification echoue");
               });
               Navigator.pop(context);
            }, 
            child: Text(
              "Enregister",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
          ],
        );
      }
      );
  }

 Future<void> showUserNomDialogAlert(BuildContext context, String nom){

    nomController.text = nom;
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenomController.text);
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenom);

    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Modifier"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nomController,
                  
                )
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text(
              "Annuler",
              style: TextStyle(
                color: Colors.red,
              ),
            )),

            TextButton(
              onPressed: () {
               userRef.child(firebaseAuth.currentUser!.uid).update({
                "nom": nomController.text.trim(),
               }).then((value) {
                nomController.clear();
                Fluttertoast.showToast(msg:" modifié avec succè");
               }).catchError((errorMessage){
                Fluttertoast.showToast(msg: " modification echoue");
               });
               Navigator.pop(context);
            }, 
            child: Text(
              "Enregister",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
          ],
        );
      }
      );
  }

 Future<void> showUserNumeroDialogAlert(BuildContext context, String numero){

    numeroController.text = numero;
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenomController.text);
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenom);

    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Modifier"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: numeroController,
                  
                )
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text(
              "Annuler",
              style: TextStyle(
                color: Colors.red,
              ),
            )),

            TextButton(
              onPressed: () {
               userRef.child(firebaseAuth.currentUser!.uid).update({
                "numero": numeroController.text.trim(),
               }).then((value) {
                numeroController.clear();
                Fluttertoast.showToast(msg:" modifié avec succè");
               }).catchError((errorMessage){
                Fluttertoast.showToast(msg: " modification echoue");
               });
               Navigator.pop(context);
            }, 
            child: Text(
              "Enregister",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
          ],
        );
      }
      );
  }

Future<void> showUserEmailDialogAlert(BuildContext context, String email){

    emailController.text = email;
    // emailSubString = userModelCurrentInfo!.email!.substring(10, 90)+"...";
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenomController.text);
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    // print(prenom);

    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Modifier"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  
                )
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text(
              "Annuler",
              style: TextStyle(
                color: Colors.red,
              ),
            )),

            TextButton(
              onPressed: () {
               userRef.child(firebaseAuth.currentUser!.uid).update({
                "email": emailController.text.trim(),
               }).then((value) {
                emailController.clear();
                Fluttertoast.showToast(msg:" modifié avec succè");
               }).catchError((errorMessage){
                Fluttertoast.showToast(msg: " modification echoue");
               });
               Navigator.pop(context);
            }, 
            child: Text(
              "Enregister",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
          ],
        );
      }
      );
  }


  @override
  Widget build(BuildContext context) {
    print(currentUser);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context);
      },
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Mon profil",
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
              Container(
                height: 200,
                width: 600,
                decoration: const BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // backgroundImage: AssetImage("assets/images/1.png"),
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,size: 60, color: MesCouleur().couleurPrincipal,),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Bienvenue Chez TaxiTigui',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  width: 600,
                  decoration:  BoxDecoration(
                      color: Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                    child: Column(
                      children: [
                        // Nom ====================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [       
                            Icon(Icons.person_outlined,color: MesCouleur().couleurPrincipal,),
                            Text("${userModelCurrentInfo!.prenom!}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(width: 160,),
                            IconButton(onPressed: () {
                               showUserPrenomDialogAlert(context, userModelCurrentInfo!.prenom!);
                            }, icon: Icon(Icons.edit_outlined),color: MesCouleur().couleurPrincipal,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 20,),


                        // Prenom ====================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [       
                            Icon(Icons.person_outlined,color: MesCouleur().couleurPrincipal,),
                            Text("${userModelCurrentInfo!.nom!}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(width: 160,),
                            IconButton(onPressed: () {
                               showUserNomDialogAlert(context, userModelCurrentInfo!.nom!);
                            }, icon: Icon(Icons.edit_outlined),color: MesCouleur().couleurPrincipal,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 20,),


                        // Tel ====================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [       
                            Icon(Icons.phone_android_outlined,color: MesCouleur().couleurPrincipal,),
                            Text("${userModelCurrentInfo!.phone!}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(width: 110,),
                            IconButton(onPressed: () {
                               showUserNumeroDialogAlert(context, userModelCurrentInfo!.phone!);
                            }, icon: Icon(Icons.edit_outlined),color: MesCouleur().couleurPrincipal,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 20,),
                        

                        // Tel ====================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [       
                            Icon(Icons.email_outlined,color: MesCouleur().couleurPrincipal,),
                            SizedBox(width: 4,),
                            Text(
                              "${userModelCurrentInfo!.email!}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          
                            IconButton(onPressed: () {
                               showUserEmailDialogAlert(context,userModelCurrentInfo!.email!);
                            }, icon: Icon(Icons.edit_outlined),color: MesCouleur().couleurPrincipal,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 20,),
                        

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}