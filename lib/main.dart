import 'package:flutter/material.dart';
import 'package:idziemy_jesc/provider/auth.dart';
import 'package:idziemy_jesc/screens/register/register_finish_screen.dart';
import 'package:idziemy_jesc/screens/register/register_preferences_screen.dart';
import 'package:idziemy_jesc/screens/register/register_start_screen.dart';
import 'package:idziemy_jesc/screens/register/register_user_data_screen.dart';
import 'package:idziemy_jesc/screens/restaurant/restaurant_screen.dart';
import 'package:idziemy_jesc/screens/restaurants_screen.dart';
import 'package:idziemy_jesc/screens/restaurants_search_screen.dart';
import 'package:idziemy_jesc/screens/together/together_start_screen.dart';
import 'package:idziemy_jesc/screens/user_profile/account_preferences_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/screens/register/register_diet_screen.dart';
import 'package:idziemy_jesc/screens/register/register_create_account_screen.dart';
import 'package:idziemy_jesc/screens/user_profile/account_main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: AppTheme.colors.primary,
          textTheme: AppTheme.typography,
          scaffoldBackgroundColor: AppTheme.colors.appBackground,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        initialRoute: RegisterStartScreen.routeName,
        routes: {
          RegisterStartScreen.routeName: (_) => const RegisterStartScreen(),
          RegisterPreferencesScreen.routeName: (_) =>
              const RegisterPreferencesScreen(),
          RegisterDietScreen.routeName: (_) => const RegisterDietScreen(),
          RegisterUserDataScreen.routeName: (_) =>
              const RegisterUserDataScreen(),
          RegisterCreateAccountScreen.routeName: (_) =>
              const RegisterCreateAccountScreen(),
          RegisterFinishScreen.routeName: (_) => const RegisterFinishScreen(),
          RestaurantsScreen.routeName: (_) => const RestaurantsScreen(),
          RestaurantScreen.routeName: (_) => const RestaurantScreen(),
          RestaurantsSearchScreen.routeName: (_) =>
              const RestaurantsSearchScreen(),
          TogetherStartScreen.routeName: (_) => const TogetherStartScreen(),
          AccountMainScreen.routeName: (_) => const AccountMainScreen(),
          AccountPreferencesScreen.routeName: (_) => const AccountPreferencesScreen(),
        },
      ),
    );
  }
}
