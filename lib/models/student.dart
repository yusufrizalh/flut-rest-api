class Student {
  // properties
  int? id;
  String? name;
  int? age;
  String? email;
  String? phone;

  // constructor
  Student({this.id, this.name, this.age, this.email, this.phone});

  // model data bertugas: menghubungkan antara json dengan flutter

  Student.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    age = json["age"]?.toInt();
    email = json["email"]?.toString();
    phone = json["phone"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["age"] = age;
    data["email"] = email;
    data["phone"] = phone;
    return data;
  }
}
