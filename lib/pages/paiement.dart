import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/accueil.dart';


class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  List<String> montant = [
    "1000",
    "2000",
    "3000",
    "4000",
    "5000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Paiement",
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
            Image(image: AssetImage("assets/images/oms.png")),
            Padding(
              padding: const EdgeInsets.only(right: 215),
              child: Text(
                "Montant à payer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffix: Text("FCFA"),
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/cash2.png"),
                    color: Color(0xFFEDB602),
                    size: 20,
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Montant à payer',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(
                            0xFFEDB602)), // Couleur de la bordure lorsqu'elle est désactivée
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      )),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 40, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color.fromARGB(255, 255, 255, 255),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 136, 136, 136),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                  )
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  montant[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEDB602),),
                                ),
                                Text(
                                  "FCFA",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEDB602),),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: Icon(Icons.history,size: 24,color: Colors.white,),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(1),
                          )),
                          backgroundColor: Color(0xFFEDB602),
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        ),
                        onPressed: () {},
                      ),
                       Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        width: 290,
                         child: ElevatedButton(
                          child: Text("CONFIRMER", style: TextStyle(fontSize: 22,color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1),
                            )),
                            backgroundColor: Color(0xFFEDB602),
                            padding:
                                EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                          onPressed: () {},
                                             ),
                       ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
