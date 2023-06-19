import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/utils/map_utils.dart';

class VolunteerAssociation {
  final String id;
  final String imagePath;
  final String associationType;
  final String name;
  final GeoPoint location;
  final String address;
  final String schedule;
  final String description;
  final int capacity;
  final int volunteers;
  bool isFavorite;

  VolunteerAssociation({
    required this.id,
    required this.imagePath,
    required this.associationType,
    required this.name,
    required this.location,
    required this.address,
    required this.schedule,
    required this.description,
    required this.capacity,
    required this.volunteers,
    this.isFavorite = false,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'associationType': associationType,
      'name': name,
      'schedule': schedule,
      'location': location,
      'address': address,
      'description': description,
    };
  }

  factory VolunteerAssociation.fromJson(Map<String, dynamic> json) {
    return VolunteerAssociation(
      id: json['id'],
      imagePath: json['imagePath'],
      associationType: json['associationType'],
      name: json['name'],
      schedule: json['schedule'],
      location: json['location'],
      address: json['address'],
      description: json['description'],
      capacity: json['capacity'],
      volunteers: json['volunteers'],
    );
  }

  int get availableCapacity => capacity - volunteers;

  void openLocation() {
    MapUtils.openMap(location.latitude, location.longitude);
  }
}
