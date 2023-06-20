import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';

class LocationNotifier extends StateNotifier<LatLng> {
  LocationNotifier() : super(const LatLng(0, 0)) {
    _init();
  }

  late LatLng location;

  Future<void> _init() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    state = LatLng(position.latitude, position.longitude);
  }
}

final locationProvider = StateNotifierProvider<LocationNotifier, LatLng>((ref) {
  return LocationNotifier();
});
