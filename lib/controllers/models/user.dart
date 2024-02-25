class user {
  String? name, address;
  String? phone, admissionNo;
  String? password;
  String? date;
  String? usertype;
  bool? entry;
  bool? exit;
  user(
      {this.name,
      this.address,
      this.password,
      this.phone,
      this.admissionNo,
      this.date,
      this.usertype,
      this.entry,
      this.exit});

  factory user.fromjson(Map<String, dynamic> json) {
    return user(
      admissionNo: json['admissionNo'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      password: json['password'],
      date: json['date'],
      usertype: json['usertype'],
      entry: json['entry'],
      exit: json['exit'],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'admission': admissionNo,
      'name': name,
      'address': address,
      'phone': phone,
      'password': password,
      'date': date,
      'usertype': usertype,
      'entry': entry,
      'exit': exit
    };
  }
}
