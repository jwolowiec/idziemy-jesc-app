import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/main_app_bar.dart';
import 'package:idziemy_jesc/widgets/main_bottom_navigation.dart';
import 'package:idziemy_jesc/widgets/restaurant_list_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_webservice/places.dart';

class RestaurantsScreen extends StatefulWidget {
  static const routeName = "/restaurants";

  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  List<PlaceDetails> places = [];

  Future getPlaces() async {
    // tylko mi ten klucz ruszycie kurwiszony a wam nogi z dupy powyrywam!
    var placesApi =
        GoogleMapsPlaces(apiKey: "AIzaSyBUKT_pVu4PAy006xHni8WoDbZVmsvN0iY");
    PlacesSearchResponse response = await placesApi.searchNearbyWithRadius(
        Location(lat: 53.4307547, lng: 14.5529801), 50,
        keyword: "food");

    Iterable<Future<PlaceDetails>> detailedPlacesIterable =
        response.results.map((place) async {
      PlacesDetailsResponse details =
          await placesApi.getDetailsByPlaceId(place.placeId);

      return details.result;
    });

    Future<List<PlaceDetails>> detailedPlaces =
        Future.wait(detailedPlacesIterable);
    List<PlaceDetails> detailedPlacesResult = await detailedPlaces;

    setState(() {
      places = detailedPlacesResult;
    });
  }

  @override
  void initState() {
    super.initState();

    getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: Text("Drawer"),
      ),
      appBar: const MainAppBar(),
      bottomNavigationBar: const MainBottomNavigation(
        routeName: RestaurantsScreen.routeName,
        selectedIndex: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppTheme.spacing.screenPadding.top),
        children: [
          buildMap(),
          const SizedBox(height: 26),
          buildHeading(),
          ...places.map(
            (place) => Padding(
              child: RestaurantListItem(
                place: place,
              ),
              padding: const EdgeInsets.only(top: 20),
            ),
          )
        ],
      ),
    );
  }

  Container buildMap() {
    return Container(
      width: double.infinity,
      height: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.mainBorderRadiusValue),
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(53.4307547, 14.5529801),
            zoom: 14,
          ),
          markers: {
            ...places.map(
              (place) => Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(240),
                markerId: MarkerId(place.placeId),
                infoWindow: InfoWindow(
                  title: place.name,
                ),
                position: LatLng(
                    place.geometry!.location.lat, place.geometry!.location.lng),
              ),
            )
          },
          zoomControlsEnabled: false,
          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(
              Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer(),
              ),
            ),
        ),
      ),
    );
  }

  Column buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Propozycje restauracji.",
          style: AppTheme.typography.headline2!.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 100,
          height: 3,
          color: AppTheme.colors.primary.shade500,
        )
      ],
    );
  }
}
