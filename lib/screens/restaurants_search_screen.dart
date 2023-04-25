import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/main_bottom_navigation.dart';
import 'package:idziemy_jesc/widgets/text_input.dart';
import 'package:idziemy_jesc/widgets/restaurant_list_item.dart';

class RestaurantsSearchScreen extends StatelessWidget {
  static const routeName = "/restaurants/search";

  const RestaurantsSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigation(
        routeName: routeName,
        selectedIndex: 1,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(AppTheme.spacing.screenPadding.top),
          children: [
            const SizedBox(height: 40),
            const TextInput(label: "Nazwa restauracji"),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(IconData(0xe280, fontFamily: 'MaterialIcons'),
                    size: 28.0, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("Filtry"),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              "Wyniki wyszukiwania:",
              style: AppTheme.typography.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
