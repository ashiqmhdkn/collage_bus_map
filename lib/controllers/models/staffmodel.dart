class staff{
  String? username;
  String? password;
  String? longitude;
  String? latitude;

  staff({this.username, this.password, this.longitude,this.latitude});

   factory staff.fromJson(Map<String, dynamic> json) {
    return staff(
      username: json['username'],
      password: json['password'],
      longitude: json['longitude'],
      latitude: json['latitude']
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'longitude': longitude,
      'latitude':latitude,
    };
  }
}
