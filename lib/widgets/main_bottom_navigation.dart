import 'package:flutter/material.dart';
import 'package:idziemy_jesc/screens/restaurants_screen.dart';
import 'package:idziemy_jesc/screens/restaurants_search_screen.dart';
import 'package:idziemy_jesc/screens/together/together_start_screen.dart';
import 'package:idziemy_jesc/screens/user_profile/account_main_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({
    Key? key,
    required this.routeName,
    required this.selectedIndex,
  }) : super(key: key);

  final String routeName;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      unselectedItemColor: AppTheme.colors.gray.shade500,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: AppTheme.colors.primary.shade500,
      backgroundColor: AppTheme.colors.appBackground,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      iconSize: 26,
      onTap: (index) {
        void changeRoute(dynamic page) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => page,
                transitionDuration: Duration.zero),
          );
        }

        if (index == 0 && routeName != RestaurantsScreen.routeName) {
          changeRoute(const RestaurantsScreen());
        } else if (index == 1 &&
            routeName != RestaurantsSearchScreen.routeName) {
          changeRoute(const RestaurantsSearchScreen());
        } else if (index == 2 && routeName != TogetherStartScreen.routeName) {
          changeRoute(const TogetherStartScreen());
          } else if (index == 3 && routeName != AccountMainScreen.routeName) {
             changeRoute(const AccountMainScreen());
        } else {
          return;
        }
      },
      items: const [
        BottomNavigationBarItem(
          label: "Restauracje",
          icon: Icon(Icons.map),
        ),
        BottomNavigationBarItem(
          label: "Szukaj",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Społeczność",
          icon: Icon(Icons.people),
        ),
        BottomNavigationBarItem(
          label: "Konto",
          icon: Icon(Icons.person),
        )
      ],
    );
  }
}
