import 'package:flutter/material.dart';
import 'package:idziemy_jesc/screens/restaurant/restaurant_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/restaurant_starts.dart';
import 'package:google_maps_webservice/places.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    Key? key,
    required this.place,
  }) : super(key: key);

  final PlaceDetails place;

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg";
    bool hasPhoto = place.photos.isNotEmpty;

    if (hasPhoto) {
      imageUrl =
          GoogleMapsPlaces(apiKey: "AIzaSyBUKT_pVu4PAy006xHni8WoDbZVmsvN0iY")
              .buildPhotoUrl(
                  photoReference: place.photos[0].photoReference,
                  maxHeight: 100,
                  maxWidth: 100);
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RestaurantScreen.routeName);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.mainBorderRadiusValue),
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              width: 71,
              height: 71,
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 72,
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 131,
                      child: Text(
                        place.name,
                        style: AppTheme.typography.headline6!.copyWith(
                          fontSize: 14,
                          height: 1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 131,
                      child: Text(
                        "Pizza, kebab, Ramol",
                        style: AppTheme.typography.bodyText2!.copyWith(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const RestaurantStars()
              ],
            ),
          )
        ],
      ),
    );
  }
}
