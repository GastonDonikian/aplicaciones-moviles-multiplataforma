class VolunteerAssociation {
  final String imagePath;
  final String associationType;
  final String name;
  final String location;
  final String address;
  final String schedule;
  final String description;

  VolunteerAssociation({
    required this.imagePath,
    required this.associationType,
    required this.name,
    required this.location,
    required this.address,
    required this.schedule,
    required this.description,
  });
  Map<String, dynamic> toJson() {
    return {
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
      imagePath: json['imagePath'],
      associationType: json['associationType'],
      name: json['name'],
      schedule: json['schedule'],
      location: json['location'],
      address: json['address'],
      description: json['description'],
    );
  }
}
