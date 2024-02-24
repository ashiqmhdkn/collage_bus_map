class user {
  String? name, address;
  String? phone, admissionNo;
  String? password;
  user({this.name, this.address, this.password, this.phone, this.admissionNo});
  factory user.fromjson(Map<String, dynamic> json) {
    return user(
        admissionNo: json['admissionNo'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        password: json['password']);
  }
  Map<String, dynamic> tojson() {
    return {
      'admission': admissionNo,
      'name': name,
      'address': address,
      'phone': phone,
      'password': password,
    };
  }
}
