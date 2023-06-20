import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

class CurrentAssociation {
  final VolunteerAssociation currentAssociation;
  final bool confirmed;

  CurrentAssociation({
    required this.currentAssociation,
    required this.confirmed,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': currentAssociation.id,
      'confirmed': confirmed,
    };
  }

  factory CurrentAssociation.fromJson(Map<String, dynamic> json) {
    return CurrentAssociation(
        currentAssociation: json['currentAssociation'],
        confirmed: json['confirmed'],
    );
  }
}