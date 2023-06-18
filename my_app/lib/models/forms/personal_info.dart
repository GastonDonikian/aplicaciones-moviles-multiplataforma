import 'package:my_app/models/gender.dart';

class PersonalInfo {
  String? birthDate;
  Gender? gender;
  String? profileImageUrl;

  PersonalInfo({
    this.birthDate,
    this.gender,
    this.profileImageUrl,
  });
}
