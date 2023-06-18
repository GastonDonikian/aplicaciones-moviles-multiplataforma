import 'package:my_app/models/gender.dart';

class Volunteer {
  String email;
  final String name;
  final String surname;
  String? imagePath;
  Gender? gender;
  String? phone;
  DateTime? birthDate;
  bool profileCompleted;

  Volunteer(
      {required this.email,
      required this.name,
      required this.surname,
      this.imagePath,
      this.gender,
      this.phone,
      this.birthDate,
      this.profileCompleted = false});

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
        imagePath: json['imagePath'],
        email: json['email'],
        name: json['name'],
        surname: json['surname'],
        gender: json['gender'] != null ? parseGender(json['gender']) : null,
        phone: json['phone'],
        birthDate: json['birthDate'],
        profileCompleted: json['profileCompleted']);
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'email': email,
      'name': name,
      'surname': surname,
      'gender': gender,
      'phone': phone,
      'birthDate': birthDate,
      'profileCompleted': profileCompleted
    };
  }

  @override
  String toString() {
    return name + " " + surname;
  }
}
