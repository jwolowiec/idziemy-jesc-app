import 'package:flutter/material.dart';
import 'package:idziemy_jesc/screens/register/register_preferences_screen.dart';
import 'package:idziemy_jesc/screens/restaurants_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';

class RegisterFinishScreen extends StatelessWidget {
  static const routeName = "/register/finish";

  const RegisterFinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.spacing.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.check_circle,
                  color: AppTheme.colors.primary.shade500,
                  size: 72,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  "Wszystko gotowe",
                  style: AppTheme.typography.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "Możesz już bez problemu korzystać z aplikacji.",
                  style: AppTheme.typography.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Button(
                  text: "Zaczynamy!",
                  onClick: () {
                    Navigator.of(context)
                        .pushNamed(RestaurantsScreen.routeName);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
