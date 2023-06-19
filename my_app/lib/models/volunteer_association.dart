import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/utils/map_utils.dart';

class VolunteerAssociation {
  final String id;
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
  bool isFavorite;

  VolunteerAssociation({
    required this.id,
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
      'schedule': schedule,
      'location': location,
      'address': address,
      'description': description,
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
