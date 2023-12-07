import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/models/reservation.dart';
import 'package:flutter_taxi_tigi_driver/models/reservationModel.dart';
import 'package:flutter_taxi_tigi_driver/models/userModel.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';


class ListeReservationEnAttente extends StatefulWidget {
  const ListeReservationEnAttente({super.key});

  @override
  State<ListeReservationEnAttente> createState() => _ListeReservationEnAttenteState();
}

class _ListeReservationEnAttenteState extends State<ListeReservationEnAttente> {



  // Future<List<Map<dynamic,dynamic>>> getAllReservation()async{
  //   DatabaseReference rideRequest = FirebaseDatabase.instance.ref().child("All Ride Request");
  //   final dataSnapshot = await rideRequest.get();
  //   final allRideRequest = dataSnapshot.children.map((e) => Map.from({e.key : e.value})).toList();
  //    print("ttttttttttttttttttttttttttttttttttt");
  //    print(allRideRequest);
  //   return allRideRequest;  
  // }

  //  static Future<void> getAllUsers() async {
  //   DatabaseReference rideRequest = FirebaseDatabase.instance.ref().child("All Ride Request");

  //   final snap = await rideRequest.once();
  //   if(snap.snapshot.value != null){
      
  //     Map<dynamic, dynamic> reservationMap = snap.snapshot.value as Map<dynamic, dynamic>;
  //     listReservation = [];
  //   reservationMap.forEach((key, value) {
  //   print('ID: $key');
  //   RideRequest reservationModel = RideRequest(
  //     userphone: key,
  //     destinationAdress: value["nom"],
  //     time: value["prenom"],
  //     originAdress: value["numero"],
  //     username: value["email"]
  //   ); 

  //   listReservation.add(reservationModel);
  //   print(listReservation);
    
  // });

  

  //   }
    
  // }

  static Future<void> getAllReservation() async {
  DatabaseReference reservationRef = FirebaseDatabase.instance.ref().child("All Ride Request");
  final snap = await reservationRef.once();

  if(snap.snapshot.value != null){
    Map<dynamic, dynamic> reservationMap = snap.snapshot.value as Map<dynamic, dynamic>;

    // Effacer la liste avant de la remplir pour éviter d'accumuler des éléments
    listReservation.clear();

    reservationMap.forEach((key, value) {
      print('ID: $key');
      print('${value}');
      ReservationModel reservationModel = ReservationModel(
        destinationAdress: value["destinationAdress"],
        originAdress: value["originAdress"],
        username: value["username"],
        userphone: value["userphone"],
      ); 

      listReservation.add(reservationModel);
    });

    print("Listes des réservations");
    print(listReservation);
  }
}

  @override
  void initState() {
    super.initState();
    getAllReservation().then((value) {
      setState(() {
        
      });
    });
  }


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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8,top: 50),
              child: Container(
                // width: 1200,
                // height: 80,
                 child: Padding(
                   padding:  EdgeInsets.all(20.0),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text(
                      "Liste des passagers",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: MesCouleur().couleurPrincipal),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 2000,
                      child: Divider(height: 1, thickness: 1, color: MesCouleur().couleurPrincipal)),
                  ],
                   ),
                   
                 ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listReservation.length,
                  itemBuilder: (BuildContext context, int index) {  
                    return Card(
                      child: ListTile(
                        leading: Image.asset("assets/icons/reservation.png"),
                        title:  Text("${listReservation[index].destinationAdress}"),
                        subtitle: Text("${listReservation[index].originAdress}"),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    );
                  },
              
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}