import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idziemy_jesc/screens/restaurant/restaurant_screen_info.dart';
import 'package:idziemy_jesc/screens/restaurant/restaurant_screen_opinion.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class RestaurantScreen extends StatefulWidget {
  // TODO: add ID
  static const routeName = "/restaurant";

  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  var infoOrOpinion = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              const ClipRRect(
                child: Image(
                  image: AssetImage(
                      "assets/images/restaurant_image_placeholder.png"),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                width: 220,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppTheme.colors.appBackground,
                ),
                margin:
                    EdgeInsets.only(top: 16, left: ((screenWidth - 220) / 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          infoOrOpinion = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: infoOrOpinion == true
                              ? AppTheme.colors.primary.shade500
                              : Colors.transparent,
                        ),
                        child: Text(
                          "Informacje",
                          style: AppTheme.typography.headline6!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          infoOrOpinion = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: infoOrOpinion == false
                              ? AppTheme.colors.primary.shade500
                              : Colors.transparent,
                        ),
                        child: Text(
                          "Opinie",
                          style: AppTheme.typography.headline6!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          infoOrOpinion == true
              ? const RestaurantInfo()
              : const RestaurantOpinion(),
          //const RestaurantInfo(),
          //const RestaurantOpinion(),
          //print(infoOrOpinion);
        ],
      ),
    );
  }
}
