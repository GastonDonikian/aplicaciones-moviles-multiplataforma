class Volunteer {
  final String imagePath;
  final String email;
  final String name;
  final String surname;

  Volunteer({
    required this.imagePath,
    required this.email,
    required this.name,
    required this.surname,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      imagePath: json['imagePath'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'email': email,
      'name': name,
      'surname': surname,
    };
  }
}