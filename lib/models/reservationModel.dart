

class RideRequest {
  String? phoneNumber;
  String? driverId;
  String? userphone;
  String? destinationAdress;
  String? time;
  String? originAdress;
  String? username;

  RideRequest({
     this.phoneNumber,
     this.driverId,
     this.userphone,
     this.destinationAdress,
     this.time,
     this.originAdress,
     this.username,
  });

  factory RideRequest.fromMap(Map<dynamic, dynamic> map) {
    return RideRequest(
      phoneNumber: map.keys.first,
      driverId: map[map.keys.first]['driverId'],
      userphone: map[map.keys.first]['userphone'],
      destinationAdress: map[map.keys.first]['destinationAdress'],
      time: map[map.keys.first]['time'],
      originAdress: map[map.keys.first]['originAdress'],
      username: map[map.keys.first]['username'],
    );
  }
}
