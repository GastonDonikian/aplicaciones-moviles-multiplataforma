import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_app/services/user_service.dart';

class ImagesService {
  final storage = FirebaseStorage.instance;
  final userRef = FirebaseStorage.instance.ref().child('users_images');
  final newsRef = FirebaseStorage.instance.ref().child('news_images');
  final volunteerAssociationRef =
      FirebaseStorage.instance.ref().child('volunteer_association_images');

  Future<String?> uploadUserImage(String userId, File imageFile) async {
    try {
      final storageRef = userRef.child(userId);
      List<int> imageBytes = await imageFile.readAsBytes();
      TaskSnapshot storageTask =
          await storageRef.putData(Uint8List.fromList(imageBytes));
      String downloadUrl = await storageTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error when saving image');
    }
  }
}
