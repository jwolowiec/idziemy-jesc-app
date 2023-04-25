import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:idziemy_jesc/provider/auth.dart';
import 'package:idziemy_jesc/screens/user_profile/account_preferences_screen.dart';
import 'package:idziemy_jesc/screens/user_profile/privacy_settings_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:idziemy_jesc/widgets/main_bottom_navigation.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';
import 'package:provider/provider.dart';

import 'account_settings_screen.dart';
import 'diet_settings_screen.dart';

class AccountMainScreen extends StatelessWidget {
  static const routeName = "/user_profile/account_main_screen";

  const AccountMainScreen({Key? key}) : super(key: key);

  String getInitials(name) {
    List<String> parts = name.toString().split(" ");
    String initials = '';

    parts.forEach((part) {
      initials += part[0].toUpperCase();
    });

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigation(
        routeName: routeName,
        selectedIndex: 3,
      ),
      body: FutureBuilder(
        future: Provider.of<AuthProvider>(context).getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }

          if (snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Zaloguj się",
                    style: AppTheme.typography.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GestureDetector(
                      child: const SelectBox(
                        text: "Logowanie przez Google",
                      ),
                      onTap: () async {
                        final provider =
                            Provider.of<AuthProvider>(context, listen: false);

                        await provider.googleLogin();
                        Navigator.of(context)
                            .pushNamed(AccountMainScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          var user = snapshot.data as User;

          return ListView(
            padding: EdgeInsets.all(AppTheme.spacing.screenPadding.top),
            children: [
              const SizedBox(height: 60),
              Row(children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.appBackgroundSecondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      getInitials(user.displayName),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.orange,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 100.0,
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        user.displayName.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.typography.headline3,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user.email.toString(),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.typography.bodyText2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(children: [
                      Icon(
                        Icons.people,
                        color: AppTheme.colors.gray.shade500,
                        size: 24.0,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.message,
                        color: AppTheme.colors.gray.shade500,
                        size: 24.0,
                      ),
                    ])
                  ]),
                ))
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.colors.appBackgroundSecondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                          child: Row(children: [
                            Icon(
                              Icons.app_settings_alt,
                              color: AppTheme.colors.gray.shade500,
                              size: 24.0,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                "Preferencje",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: AppTheme.colors.gray.shade500,
                              size: 24.0,
                            ),
                          ]),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AccountPreferencesScreen.routeName);
                          }),
                      GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(children: [
                              Icon(
                                Icons.cake,
                                color: AppTheme.colors.gray.shade500,
                                size: 24.0,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  "Diety",
                                  style: AppTheme.typography.bodyText1,
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: AppTheme.colors.gray.shade500,
                                size: 24.0,
                              ),
                            ]),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DietSettingsScreen()));
                          }),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppTheme.colors.appBackgroundSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    GestureDetector(
                        child: Row(children: [
                          Icon(
                            Icons.settings,
                            color: AppTheme.colors.gray.shade500,
                            size: 24.0,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Ustawienia konta",
                              style: AppTheme.typography.bodyText1,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: AppTheme.colors.gray.shade500,
                            size: 24.0,
                          ),
                        ]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AccountSettingsScreen()));
                        }),
                    GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(children: [
                            Icon(
                              Icons.lock,
                              color: AppTheme.colors.gray.shade500,
                              size: 24.0,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                "Prywatność",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: AppTheme.colors.gray.shade500,
                              size: 24.0,
                            ),
                          ]),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PrivacySettingsScreen()));
                        }),
                    GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(children: [
                            Icon(
                              Icons.access_time,
                              color: AppTheme.colors.gray.shade500,
                              size: 24.0,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                "Historia",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: AppTheme.colors.gray.shade500,
                              size: 24.0,
                            ),
                          ]),
                        ),
                        onTap: () {
                          //RAMOL ZRUP TOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
                        }),
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.red,
                              size: 24.0,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                "Wyloguj się",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        final provider =
                            Provider.of<AuthProvider>(context, listen: false);

                        provider.signOut();
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
