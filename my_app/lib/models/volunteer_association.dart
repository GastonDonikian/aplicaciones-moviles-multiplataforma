import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/utils/map_utils.dart';
import 'dart:math' show cos, sqrt, asin;

class VolunteerAssociation {
  final String id;
  final String imagePath;
  final String associationType;
  final String name;
  final String subtitle;
  final GeoPoint location;
  final String address;
  final String description;
  final int capacity;
  int volunteers;
  final String requirements;
  bool isFavorite;
  double? distance;

  VolunteerAssociation({
    required this.id,
    required this.imagePath,
    required this.associationType,
    required this.name,
    required this.subtitle,
    required this.location,
    required this.address,
    required this.description,
    required this.capacity,
    required this.volunteers,
    required this.requirements,
    this.isFavorite = false,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'associationType': associationType,
      'name': name,
      'subtitle': subtitle,
      'location': location,
      'address': address,
      'description': description,
      'capacity': capacity,
      'volunteers': volunteers,
      'requirements': requirements.replaceAll('\n', r'\n'),
    };
  }

  factory VolunteerAssociation.fromJson(Map<String, dynamic> json) {
    return VolunteerAssociation(
      id: json['id'],
      imagePath: json['imagePath'],
      associationType: json['associationType'],
      name: json['name'],
      subtitle: json['subtitle'],
      location: json['location'],
      address: json['address'],
      description: json['description'],
      requirements: json['requirements'].replaceAll(r'\n', '\n'),
      capacity: json['capacity'],
      volunteers: json['volunteers'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  int get availableCapacity => capacity - volunteers;

  void openLocation() {
    MapUtils.openMap(location.latitude, location.longitude);
  }

  double calculateDistance(lat, lon) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((location.latitude - lat) * p) / 2 +
        c(lat * p) *
            c(location.latitude * p) *
            (1 - c((location.longitude - lon) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
