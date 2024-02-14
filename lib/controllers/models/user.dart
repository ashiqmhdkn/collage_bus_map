class user {
  String? name;
  int? phone;
  String? id;
  String? email;
  user({this.name, this.email, this.phone, this.id});
  factory user.fromjson(Map<String, dynamic> json) {
    return user(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone']);
  }
  Map<String, dynamic> tojson() {
    return {
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
    };
  }
}
