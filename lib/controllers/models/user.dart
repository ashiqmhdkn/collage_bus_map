class User {
  String? name, address;
  String? phone, admissionNo;
  String? password;
  String? usertype;
  List<Journey>? journeys;

  User({
    this.name,
    this.address,
    this.password,
    this.phone,
    this.admissionNo,
    this.usertype,
    this.journeys,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var journeysJson = json['journeys'] as List<dynamic>? ?? [];
    List<Journey> journeys = journeysJson
        .map((journeyJson) => Journey.fromJson(journeyJson))
        .toList();

    return User(
      admissionNo: json['admissionNo'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      password: json['password'],
      usertype: json['usertype'],
      journeys: journeys,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'admission': admissionNo,
      'name': name,
      'address': address,
      'phone': phone,
      'password': password,
      'usertype': usertype,
      'journeys': journeys?.map((journey) => journey.toJson()).toList(),
    };
  }
}

class Journey {
  String? date;
  bool? entry;
  bool? exit;

  Journey({this.date, this.entry, this.exit});

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      date: json['date'],
      entry: json['entry'],
      exit: json['exit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'entry': entry,
      'exit': exit,
    };
  }
}
