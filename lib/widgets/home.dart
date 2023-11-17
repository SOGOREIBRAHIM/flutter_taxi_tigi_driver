import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/pages/Profil.dart';
import 'package:flutter_taxi_tigi_driver/pages/devenirChauffeur.dart';
import 'package:flutter_taxi_tigi_driver/pages/paiement.dart';
import 'package:flutter_taxi_tigi_driver/pages/trajet.dart';
import 'package:flutter_taxi_tigi_driver/splashScrum/splashScrum.dart';
import 'package:flutter_taxi_tigi_driver/widgets/maps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexCourant = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List pages = [
    DevenirChauffeur(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Color(0xFFEDB602),

      ),
      body: Stack(
        children: [
          const Maps(),
          // InputSearch(),

          Positioned(
            top: 15,
            left: 20,
            child: Container(
              height: 50,
              width: 50,
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: CircleAvatar(
                  backgroundColor: MesCouleur().couleurPrincipal,
                  child: Icon(
                    (Icons.menu), color: Colors.white,size: 40,
                  ),
                ),
              ),
            ),
            )
          // IconButton(
          //   // padding: const EdgeInsets.only(top: 50, left: 20),
          //   onPressed: () {
          //     _scaffoldKey.currentState!.openDrawer();
          //   },
          //   icon: const Icon(
          //     Icons.menu_sharp,
          //     color: Color(0xFFEDB602),
          //     size: 50,
          //   ),
          //   // icon: ImageIcon(AssetImage("assets/images/menu.png"),color: Color(0xFFEDB602), size: 200,),
          // ),
        ],
      ),
      drawer: Drawer(
          child: Column(
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFEDB602), Color(0xFFFFFFFF)])),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/1.png"),
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ibrahim',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'SOGORE',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => profil()));
                      },
                      child: Text(
                        "Voir mon profil",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        ),
                    )
                  ],
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Paiement())));
            },
            leading:
                Icon(FontAwesomeIcons.wallet, size: 25, color: Color(0xFFEDB602)),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 18),
            title: const Text(
              "Paiement",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Trajet())));
            },
            leading:
                Icon(FontAwesomeIcons.route, size: 25, color: Color(0xFFEDB602)),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 18),
            title: const Text(
              "Trajets",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/devenirChauffeur");
            },
            leading: Image.asset("assets/images/Driver.png",
                color: Color(0xFFEDB602)),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 18),
            title: const Text(
              "Devenir chauffeur",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/annulerReservation");
            },
            leading:
                Icon(Icons.cancel_rounded, size: 30, color: Color(0xFFEDB602)),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 18),
            title: const Text(
              "Annuler reservation",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/apropos");
            },
            leading: Icon(Icons.help, size: 30, color: Color(0xFFEDB602)),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 18),
            title: const Text(
              "Apropos",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          SizedBox(height: 180,),
          ListTile(
            onTap: () {
              firebaseAuth.signOut();
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Slapsh())));
            },
            leading: Icon(Icons.logout, size: 30, color: Colors.red),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 18,color:Colors.red, ),
            title: const Text(
              "Deconnexion",
              style:
                  TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
        ],
      )),
    );
  }
}


