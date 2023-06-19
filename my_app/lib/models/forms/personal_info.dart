import 'dart:io';

import 'package:my_app/models/gender.dart';

class PersonalInfo {
  String? birthDate;
  Gender? gender;
  String? profileImageUrl;
  File? profileImageFile;

  PersonalInfo({
    this.birthDate,
    this.gender,
    this.profileImageUrl,
    this.profileImageFile,
  });
}
