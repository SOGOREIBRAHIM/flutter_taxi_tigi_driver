import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';

class Trajet extends StatefulWidget {
  const Trajet({super.key});

  @override
  State<Trajet> createState() => _TrajetState();
}

class _TrajetState extends State<Trajet> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Historique des trajets",
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
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher un trajet",
                  prefixIcon: Icon(Icons.search, color: MesCouleur().couleurPrincipal, size: 30,),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                // height: MediaQuery.of(context).size.height,
                height: 300,
                width: 400,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 107, 105, 105),
                      spreadRadius: 1,
                      blurRadius: 5
                    )
                  ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("29-11-2023", style: TextStyle(color: Colors.black,fontSize: 20),),
                      ),
                      SizedBox(height: 10,),
                     Row(
                      children: [
                         Icon(Icons.location_on ,color: MesCouleur().couleurPrincipal,size: 30,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Point de départ"),
                            Text("Amdallaye ACI 2000", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),
                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Icon(Icons.location_city ,color: MesCouleur().couleurPrincipal,size: 35,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Destination"),
                            Text("Magnambougou projet", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),
                     
                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Icon(Icons.person ,color: MesCouleur().couleurPrincipal,size: 35,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chauffeur"),
                            Text("Mamadou FADIGA", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),

                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Image(image: AssetImage(("assets/images/cash2.png")),color: MesCouleur().couleurPrincipal,),
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Montant payé"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("2300 FCFA ", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                                SizedBox(width: 100,),
                                Text("en espece", style: TextStyle(fontSize: 15, color: Colors.black),),
                              ],
                            ),
                          ],
                         ),
                      ],
                     ),
                     
                    ],
                    
                  ),
                ),
              ),

              SizedBox(height: 30,),


              Container(
                // height: MediaQuery.of(context).size.height,
                height: 300,
                width: 400,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 107, 105, 105),
                      spreadRadius: 1,
                      blurRadius: 5
                    )
                  ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("29-11-2023", style: TextStyle(color: Colors.black,fontSize: 20),),
                      ),
                      SizedBox(height: 10,),
                     Row(
                      children: [
                         Icon(Icons.location_on ,color: MesCouleur().couleurPrincipal,size: 30,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Point de départ"),
                            Text("Amdallaye ACI 2000", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),
                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Icon(Icons.location_city ,color: MesCouleur().couleurPrincipal,size: 35,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Destination"),
                            Text("Magnambougou projet", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),
                     
                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Icon(Icons.person ,color: MesCouleur().couleurPrincipal,size: 35,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chauffeur"),
                            Text("Mamadou FADIGA", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),

                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Image(image: AssetImage(("assets/images/cash2.png")),color: MesCouleur().couleurPrincipal,),
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Montant payé"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("2300 FCFA ", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                                SizedBox(width: 100,),
                                Text("en espece", style: TextStyle(fontSize: 15, color: Colors.black),),
                              ],
                            ),
                          ],
                         ),
                      ],
                     ),
                     
                    ],
                    
                  ),
                ),
              ),

              SizedBox(height: 30,),


              Container(
                // height: MediaQuery.of(context).size.height,
                height: 300,
                width: 400,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 107, 105, 105),
                      spreadRadius: 1,
                      blurRadius: 5
                    )
                  ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("29-11-2023", style: TextStyle(color: Colors.black,fontSize: 20),),
                      ),
                      SizedBox(height: 10,),
                     Row(
                      children: [
                         Icon(Icons.location_on ,color: MesCouleur().couleurPrincipal,size: 30,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Point de départ"),
                            Text("Amdallaye ACI 2000", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),
                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Icon(Icons.location_city ,color: MesCouleur().couleurPrincipal,size: 35,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Destination"),
                            Text("Magnambougou projet", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),
                     
                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Icon(Icons.person ,color: MesCouleur().couleurPrincipal,size: 35,) ,
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chauffeur"),
                            Text("Mamadou FADIGA", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                          ],
                         ),
                      ],
                     ),

                     SizedBox(height: 10,),
                      Row(
                      children: [
                         Image(image: AssetImage(("assets/images/cash2.png")),color: MesCouleur().couleurPrincipal,),
                         SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Montant payé"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("2300 FCFA ", style: TextStyle(fontSize: 20, color: MesCouleur().couleurPrincipal),),
                                SizedBox(width: 100,),
                                Text("en espece", style: TextStyle(fontSize: 15, color: Colors.black),),
                              ],
                            ),
                          ],
                         ),
                      ],
                     ),
                     
                    ],
                    
                  ),
                ),
              ),

              

              
            ],
          ),
        ),
      ),
    );
  }
}