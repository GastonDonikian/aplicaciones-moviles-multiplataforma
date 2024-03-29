import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/search/',
      query: 'api=1&query=$latitude,$longitude',
    );
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
