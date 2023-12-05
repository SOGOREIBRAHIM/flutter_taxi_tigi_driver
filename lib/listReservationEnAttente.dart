import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/models/reservationModel.dart';
import 'package:flutter_taxi_tigi_driver/models/userModel.dart';


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

   static Future<void> getAllUsers() async {
    DatabaseReference rideRequest = FirebaseDatabase.instance.ref().child("All Ride Request");

    final snap = await rideRequest.once();
    if(snap.snapshot.value != null){
      
      Map<dynamic, dynamic> reservationMap = snap.snapshot.value as Map<dynamic, dynamic>;
      listReservation = [];
    reservationMap.forEach((key, value) {
    print('ID: $key');
    RideRequest reservationModel = RideRequest(
      userphone: key,
      destinationAdress: value["nom"],
      time: value["prenom"],
      originAdress: value["numero"],
      username: value["email"]
    ); 

    listReservation.add(reservationModel);
    print(listReservation);
    
  });

  

    }
    
  }

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            
            Container(
              
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ), 
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: listReservation.length,
                itemBuilder: (context, index){
                  return Container(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                       height: 10,
                       width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 239, 253, 178),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 187, 187, 187),
                                spreadRadius: 2,
                                blurRadius: 1,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                                        // backgroundImage: AssetImage("assets/images/1.png"),
                                  radius: 40,
                                  backgroundColor: MesCouleur().couleurPrincipal,
                                  child: Text("MK", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
                                ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Icon(Icons.person, color: MesCouleur().couleurPrincipal,),
                                    SizedBox(width: 20,),
                                    Text(
                                      "${listReservation[index].username}"
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0,),
                                Row(
                                  children: [
                                    Icon(Icons.person, color: MesCouleur().couleurPrincipal,),
                                    SizedBox(width: 20,),
                                    Text(
                                      "${listReservation[index].userphone}"
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0,),
                                Row(
                                  children: [
                                    Icon(Icons.phone_android, color: MesCouleur().couleurPrincipal,),
                                    SizedBox(width: 20,),
                                    Text(
                                      "${listReservation[index].userphone}"
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0,),
                                Row(
                                  children: [
                                    Icon(Icons.email, color: MesCouleur().couleurPrincipal,),
                                    SizedBox(width: 20,),
                                    Text(
                                      "${listReservation[index].userphone}"
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                 } ,
                ),
            )
          ],
        ),
      ),
    );
  }
}