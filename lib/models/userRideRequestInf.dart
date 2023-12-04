
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserRideRequestInfo {
  
  LatLng? originLatLng;
  LatLng? destinationLatLng;
  String? originAdress;
  String? destinationAdress;
  String? rideRequestId;
  String? username;
  String? userPhone;

  UserRideRequestInfo({
    this.originLatLng,
    this.destinationLatLng,
    this.originAdress,
    this.destinationAdress,
    this.rideRequestId,
    this.userPhone,
    this.username
  });
}