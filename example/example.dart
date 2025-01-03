import 'package:mapbox_api_pro/mapbox_api_pro.dart';

void main() async {
  /**
   * Get your Mapbox API token on https://www.mapbox.com/
   */
  final mapbox = MapboxApi(
    accessToken: 'pk.eyJ1IjoiY3VwZXItdGVjIiwiYSI6ImNsd2lud2lnYjB0NDkya244aDQzMTZpeGgifQ.5EgxR4zaaHXUIuo3uLXhlA'
    //accessToken: '<Mapbox API token>',
  );

  /**
   * Here is a simple HTTPS call to directions API.
   * All parameters matches official documentation
   * and are described at https://docs.mapbox.com/api/
   *
   * Available APIs:
   *  - mapbox.directions
   *  - mapbox.isochrome
   *  - mapbox.mapMatching
   *  - mapbox.matrix
   *  - mapbox.optimization
   *  - mapbox.forwardGeocoding
   *  - mapbox.reverseGeocoding
   *  - mapbox.intersection
   *
   */
  final response = await mapbox.directions.request(
    profile: NavigationProfile.DRIVING_TRAFFIC,
    overview: NavigationOverview.FULL,
    geometries: NavigationGeometries.GEOJSON,
    steps: true,
    coordinates: <List<double>>[
      <double>[
        37.786060, // latitude
        -122.246225, // longitude
      ],
      <double>[
        37.785939, // latitude
        -122.194292, // longitude
      ],
    ],
  );

  if (response.error != null) {
    if (response.error is NavigationNoRouteError) {
      // handle NoRoute response
    } else if (response.error is NavigationNoSegmentError) {
      // handle NoSegment response
    }

    return;
  }

  if (response.routes!.isNotEmpty) {
    final route = response.routes![0];
    final eta = Duration(
      seconds: route.duration!.toInt(),
    );
    print(eta.toString());
  }
}
