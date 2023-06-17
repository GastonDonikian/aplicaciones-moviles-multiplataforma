import 'package:my_app/models/gender.dart';

class Volunteer {
  String email;
  final String name;
  final String surname;
  String? imagePath;
  Gender? gender;
  String? phone;
  DateTime? birthDate;

  Volunteer(
      {required this.email,
      required this.name,
      required this.surname,
      this.imagePath,
      this.gender,
      this.phone,
      this.birthDate});

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
        imagePath: json['imagePath'] as String,
        email: json['email'] as String,
        name: json['name'] as String,
        surname: json['surname'] as String,
        gender: json['gender'] as Gender,
        phone: json['phone'] as String,
        birthDate: json['birthDate'] as DateTime);
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'email': email,
      'name': name,
      'surname': surname,
      'gender': gender,
      'phone': phone,
      'birthDate': birthDate
    };
  }
}
