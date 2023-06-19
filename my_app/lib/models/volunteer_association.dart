
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/utils/map_utils.dart';
import 'package:markdown/markdown.dart' as md;

class VolunteerAssociation {
  final String imagePath;
  final String associationType;
  final String name;
  final String subtitle;
  final GeoPoint location;
  final String address;
  final String schedule;
  final String description;
  final int capacity;
  final int volunteers;
  final String requirements;

  VolunteerAssociation({
    required this.imagePath,
    required this.associationType,
    required this.name,
    required this.subtitle,
    required this.location,
    required this.address,
    required this.schedule,
    required this.description,
    required this.capacity,
    required this.volunteers,
    required this.requirements
  });
  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'associationType': associationType,
      'name': name,
      'subtitle': subtitle,
      'schedule': schedule,
      'location': location,
      'address': address,
      'description': description,
      'requirements': requirements.replaceAll('\n', r'\n'),
    };
  }

  factory VolunteerAssociation.fromJson(Map<String, dynamic> json) {
    return VolunteerAssociation(
      imagePath: json['imagePath'],
      associationType: json['associationType'],
      name: json['name'],
      subtitle: json['subtitle'],
      schedule: json['schedule'],
      location: json['location'],
      address: json['address'],
      description: json['description'],
      requirements: json['requirements'].replaceAll(r'\n', '\n'),
      capacity: json['capacity'],
      volunteers: json['volunteers'],
    );
  }


  int get availableCapacity => capacity - volunteers;

  void openLocation() {
    MapUtils.openMap(location.latitude, location.longitude);
  }
}
