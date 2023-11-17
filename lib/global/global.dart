import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_tigi_driver/models/directionDetailsInfo.dart';
import 'package:flutter_taxi_tigi_driver/models/userModel.dart';


final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUser;

UserModel? userModelCurrentInfo;

String userDropOffAdress = "";

DirectionDetailsInfo? tripDirectionDetailsInfo;
