import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/main_bottom_navigation.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';

import 'account_main_screen.dart';

class PrivacySettingsScreen extends StatefulWidget {
  static const routeName = "/restaurants/privacy-settings";

  const PrivacySettingsScreen({Key? key}) : super(key: key);

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreen();
}

class _PrivacySettingsScreen extends State<PrivacySettingsScreen> {
  var publicOrPrivate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.appBackground,
        elevation: 0,
        title: Text("Prywatność", style: AppTheme.typography.headline5),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: GestureDetector(
            onTap: () {
              print("dziala");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountMainScreen()));
            },
            child: Padding(
                padding: AppTheme.spacing.screenPadding.copyWith(bottom: 18, top: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.colors.gray,
                    ),
                    Text(
                      "Profil",
                      style: TextStyle(
                        color: AppTheme.colors.gray,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
      bottomNavigationBar: const MainBottomNavigation(
        routeName: PrivacySettingsScreen.routeName,
        selectedIndex: 3,
      ),
      body: Container(
        padding: AppTheme.spacing.screenPadding,
        child: ListView(
          children: [
            Text(
              "Status profilu",
              style: AppTheme.typography.headline6,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SelectBox(
                      text: "Publiczny",
                      isHighlighted: publicOrPrivate == true ? true : false,
                      onClick: () {
                        setState(() {
                          publicOrPrivate = true;
                        });
                      },
                    ),
                    //margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    child: SelectBox(
                      text: "Prywatny",
                      isHighlighted: publicOrPrivate == false ? true : false,
                      onClick: () {
                        setState(() {
                          publicOrPrivate = false;
                        });
                      },
                    ),
                    //margin: const EdgeInsets.only(bottom: 15),
                  ),
                ],
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: TextStyle(
                color: AppTheme.colors.textTertiary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "Twoje dane",
                style: AppTheme.typography.headline6,
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: TextStyle(
                color: AppTheme.colors.textTertiary,
              ),
            ),
            Container(
              height: 50,
              width: 150,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Pobierz",
                  style: AppTheme.typography.headline6,
                ),
                color: AppTheme.colors.gray.shade700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppTheme.colors.gray)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Historia żądań danych",
                style: AppTheme.typography.headline6,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.cancel_rounded,
                  color: AppTheme.colors.gray,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Brak żądań",
                  style: TextStyle(color: AppTheme.colors.textTertiary),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
