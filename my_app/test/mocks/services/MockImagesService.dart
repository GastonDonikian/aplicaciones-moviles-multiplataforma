import 'dart:io';
import 'package:my_app/services/images_service.dart';

class MockImagesService extends ImagesService {
  @override
  Future<String?> uploadUserImage(String userId, File imageFile) async {
    return 'www.google.com';
  }
}