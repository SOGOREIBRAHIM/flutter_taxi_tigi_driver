import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';

class ProgressDialog extends StatelessWidget {


  String? message;
  ProgressDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            SizedBox(width: 6,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(MesCouleur().couleurPrincipal),
            ),
            SizedBox(width: 26,),
            Text(message!, style: TextStyle(
              color: Colors.black,
              fontSize: 12
            ),)
          ],
        ),
      ),
    );
  }
}