class User {
  String? name;
  String? status;
  String? gender;
  String? email;

  User({
    this.name,
    this.status,
    this.gender,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        status = json['status'],
        gender = json['gender'];
}
