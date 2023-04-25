import 'package:flutter/material.dart';
import 'package:idziemy_jesc/provider/auth.dart';
import 'package:idziemy_jesc/screens/register/register_preferences_screen.dart';
import 'package:idziemy_jesc/screens/restaurants_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:idziemy_jesc/provider/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterStartScreen extends StatefulWidget {
  static const routeName = "/register/start";

  const RegisterStartScreen({Key? key}) : super(key: key);

  @override
  State<RegisterStartScreen> createState() => _RegisterStartScreenState();
}

class _RegisterStartScreenState extends State<RegisterStartScreen> {
  bool isLoading = true;

  void checkIfLoggedIn(context) async {
    final user = (await Provider.of<AuthProvider>(context).getCurrentUser());
    
    if (user?.displayName != null) {
      Navigator.of(context).pushNamed(RestaurantsScreen.routeName);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      checkIfLoggedIn(context);
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: AppTheme.spacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeading(context),
                  Button(
                    onClick: () {
                      Navigator.of(context)
                          .pushNamed(RegisterPreferencesScreen.routeName);
                    },
                    text: "Pewnie!",
                  ),
                ],
              ),
            ),
            Container(
              child: Button(
                onClick: () {},
                text: "Mam już konto",
                variant: "tertiary",
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildHeading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      child: RichText(
        text: TextSpan(
          style: AppTheme.typography.headline1,
          children: [
            TextSpan(
              text: "Cześć! ",
              style: TextStyle(
                color: AppTheme.colors.primary.shade500,
              ),
            ),
            const TextSpan(
              text: "zanim rozpoczniemy zadam Ci kilka prostych pytań, ",
            ),
            TextSpan(
              text: "gotowy?",
              style: TextStyle(
                color: AppTheme.colors.primary.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
