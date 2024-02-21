class user {
  String? name, address;
  int? phone, admissionNo;
  int? dob;
  user({this.name, this.address, this.dob, this.phone, this.admissionNo});
  factory user.fromjson(Map<String, dynamic> json) {
    return user(
        admissionNo: json['admissionNo'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        dob: json['dob']);
  }
  Map<String, dynamic> tojson() {
    return {
      'admission': admissionNo,
      'name': name,
      'address': address,
      'phone': phone,
      'dob':dob,
    };
  }
}
