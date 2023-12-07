
import 'package:firebase_database/firebase_database.dart';

class ReservationModel {
  String? destinationAdress;
  String? driverId;
  String? originAdress;
  DateTime? time;
  String? username;
  String? userphone;


  ReservationModel({
     this.destinationAdress,
     this.driverId,
     this.originAdress,
     this.time,
     this.username,
     this.userphone,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      destinationAdress: json['destinationAdress'],
      driverId: json['driverId'],
      originAdress: json['originAdress'],
      time: DateTime.parse(json['time']),
      username: json['username'],
      userphone: json['userphone'],
    );
  }

  


}