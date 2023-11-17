
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/assistance/requsetAssistant.dart';
import 'package:flutter_taxi_tigi_driver/config/configurationCouleur.dart';
import 'package:flutter_taxi_tigi_driver/global/global.dart';
import 'package:flutter_taxi_tigi_driver/infoHandler/app_info.dart';
import 'package:flutter_taxi_tigi_driver/models/direction.dart';
import 'package:flutter_taxi_tigi_driver/models/predictionPlace.dart';
import 'package:flutter_taxi_tigi_driver/widgets/progressDialog.dart';
import 'package:provider/provider.dart';

class PredictionPlaceDesign extends StatefulWidget {


  final PredictionPlacle predictionPlacle;

  PredictionPlaceDesign({ required this.predictionPlacle});

  @override
  State<PredictionPlaceDesign> createState() => _PredictionPlaceDesignState();
}

class _PredictionPlaceDesignState extends State<PredictionPlaceDesign> {

  getPlaceDirectionDetails(String? placeId, context ) async{
    showDialog(
      context: context, 
      builder: (BuildContext context) => ProgressDialog(
      message: "Veuillez patienter",
    )
    );
     var mapKey = "AIzaSyDDGtmVxuMl8rMOacYgbdEfghp2xpOeYQg";
    String placeDirectionDetailsUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";
    var responseApi = await RequsetAssistant.receiveRequest(placeDirectionDetailsUrl);
    Navigator.pop(context);
    if (responseApi == "Error Occured. Failed. No Response") {
      return;
    }

    if (responseApi["status"] == "OK") {
      Direction direction = Direction();
      direction.locationName = responseApi["result"]["name"];
      direction.locationId = placeId;
      direction.locationLagitude = responseApi["result"]["geometry"]["location"]["lat"];
      direction.locationLongitude = responseApi["result"]["geometry"]["location"]["lng"];

      Provider.of<AppInfo>(context, listen: false).updateDropOffAdressLcation(direction);
      setState(() {
        userDropOffAdress = direction.locationName!;
      });

      Navigator.pop(context, "obtainedDropOf");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          getPlaceDirectionDetails(widget.predictionPlacle.place_id, context);

        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white), 
        child: Padding(padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.add_location,
            color: MesCouleur().couleurPrincipal,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.predictionPlacle!.main_Text!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: MesCouleur().couleurPrincipal,
                  ),
                ),
                Text(
                  widget.predictionPlacle!.second_Text!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: MesCouleur().couleurPrincipal,
                  ),
                ),
              ],
            )
          ],
        ),
        ));
  }
}