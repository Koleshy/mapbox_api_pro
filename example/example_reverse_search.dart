import 'package:mapbox_api_pro/mapbox_api_pro.dart';

void main() async {
  final mapbox = MapboxApi(
    accessToken: 'pk.eyJ1IjoiY3VwZXItdGVjIiwiYSI6ImNsd2lud2lnYjB0NDkya244aDQzMTZpeGgifQ.5EgxR4zaaHXUIuo3uLXhlA'
    //accessToken: '<Mapbox API token>',
  );

  // latitud: -77.0413016047005, longitud: -12.070314246601962

  final response = await mapbox.reverseGeocoding.request(
    coordinate: <double>[
      -12.070314246601962,
      -77.0413016047005,

      //-12.070311,
      //-77.0390502
      //48.858638, // latitude
      //2.286020, // longitude
    ],
    language: 'es',
  );

  if (response.error != null) {
    if (response.error is GeocoderError) {
      print('GeocoderError: ${(response.error as GeocoderError).message}');
      return;
    }

    print('Network error');
    return;
  }

  if (response.features != null && response.features!.isNotEmpty) {
    for (final feature in response.features!) {
      print(feature.placeName);
    }
  }
}
