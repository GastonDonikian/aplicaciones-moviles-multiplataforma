import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? currentAssociation;
  bool? confirmedByAssociation;

  Volunteer(
      {required this.email,
      required this.name,
      required this.surname,
      this.imagePath,
      this.currentAssociation,
      this.confirmedByAssociation,
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
      currentAssociation: json['currentAssociation'],
      confirmedByAssociation: json['confirmedByAssociation'],
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      profileCompleted: json['profileCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'email': email,
      'name': name,
      'surname': surname,
      'gender': gender != null ? gender!.value : null,
      'confirmedByAssociation': confirmedByAssociation ?? false,
      'phone': phone,
      'birthDate': birthDate != null ? birthDate!.toIso8601String() : null,

      'profileCompleted': profileCompleted
    };
  }

  String getFullname() {
    return "$name $surname";
  }

  @override
  String toString() {
    // return a string with all the properties
    return '$name $surname $email $profileCompleted';
  }
}
