import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_taxi_tigi_driver/models/driverModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_taxi_tigi_driver/models/directionDetailsInfo.dart';
import 'package:flutter_taxi_tigi_driver/models/userModel.dart';



final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUser;

UserModel? userModelCurrentInfo;

Position? driverCurrentPosition;

DriverData onlineDriverData = DriverData();

String driverVehiculeType = "";
