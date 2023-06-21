import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlng/latlng.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/providers/favorites_provider.dart';
import 'package:my_app/providers/location_provider.dart';

class MockLocationNotifier extends StateNotifier<LatLng> implements LocationNotifier {
  @override
  late LatLng location;

  MockLocationNotifier() : super(const LatLng(0, 0)) {
    _init();
  }

  Future<void> _init() async {
    state = LatLng(1.1, 2.1);
  }
}


final mockLocationProvider = StateNotifierProvider<MockLocationNotifier, LatLng>((ref) {return MockLocationNotifier();});
