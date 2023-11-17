import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/pages/formAdresse.dart';


class InputSearch extends StatefulWidget {
  const InputSearch({Key? key}) : super(key: key);

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  

  

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      left: 30,
      bottom: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 250,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 199, 199, 199),
                    blurRadius: 10.0,
                    spreadRadius: 3.0,
                  ),
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: TextFormField(
                readOnly: true,
                onTap: () async {
                  var resonseAutoCompleteSearch = await Navigator.push(context, MaterialPageRoute(builder: (c)=>FormAdresse()));

                  if (resonseAutoCompleteSearch == "obtainedDropoff") {
                    setState(() {
                      // openNavigationDrawer = false;
                    });
                  }
                },
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(210, 54, 54, 54),
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Où voulez-vous aller ?',
                  hintStyle: TextStyle(fontSize: 20),
                  contentPadding: EdgeInsets.only(left: 20)
                ),
              ),
            ),
            Container (
              child: Column(
                children: [
                  ElevatedButton(
                    child: Icon(Icons.calendar_month_outlined, color: Colors.white,),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(0),
                      )),
                      backgroundColor: Color(0xFFEDB602),
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
