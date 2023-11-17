
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/models/direction.dart';


class AppInfo extends ChangeNotifier {
  
  Direction? userPickeUpLocation, userDropOfLocation;
  int countTotalTrips = 0;
  // List<String> historyTripsKeyListner = [];
  // List<TripsHistoryModel> allTripsHistoryInformationList = [];

  void updatePickupLocationAdress(Direction userPickUpAdress){
    userPickeUpLocation = userPickUpAdress;
    notifyListeners();
  }

  void updateDropOffAdressLcation(Direction dropOffAdress){
    userDropOfLocation = dropOffAdress;
    notifyListeners();
  }


}