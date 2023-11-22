
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserRideRequestInfo {
  
  LatLng? originLatLng;
  LatLng? destinationLatLng;
  String? originAddress;
  String? destinationAddress;
  String? rideRequestId;
  String? username;
  String? userPhone;

  UserRideRequestInfo({
    this.originLatLng,
    this.destinationLatLng,
    this.originAddress,
    this.destinationAddress,
    this.rideRequestId,
    this.userPhone,
    this.username
  });
}