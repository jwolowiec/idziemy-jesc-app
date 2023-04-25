import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';
import 'package:idziemy_jesc/screens/user_profile/account_main_screen.dart';

class AccountPreferencesScreen extends StatefulWidget {
  static const routeName = "/account/preferences";

  const AccountPreferencesScreen({Key? key}) : super(key: key);

  @override
  _AccountPreferencesScreenState createState() =>
      _AccountPreferencesScreenState();
}

const List<Map> kitchenTypes = [
  {"name": "pizza", "label": "Pizza"},
  {"name": "kebab", "label": "Kebab"},
  {"name": "deserts", "label": "Desery"},
  {"name": "soups", "label": "Zupy"},
  {"name": "salads", "label": "Saładki"},
  {"name": "burgers", "label": "Burgery"},
  {"name": "chinese", "label": "Chińszczyzna"},
  {"name": "pasta", "label": "Makarony"},
  {"name": "other", "label": "Inne"},
];

class _AccountPreferencesScreenState extends State<AccountPreferencesScreen> {
  Map selectedKitchenTypes = {};

  @override
  void initState() {
    setState(() {
      for (var element in kitchenTypes) {
        selectedKitchenTypes[element["name"]] = false;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.spacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              child: Row(
                children: [
                  GestureDetector(
                      child: Row(
                          children: [
                        Icon(
                          Icons.navigate_before,
                          color: AppTheme.colors.gray.shade500,
                          size: 30.0,
                        ),
                        Button(
                          text: "Profil",
                          variant: "tertiary",
                          onClick: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]),
                      onTap: () {
                        Navigator.of(context).pop();
                      }),
                  Expanded(
                    child: Text(
                      "Preferencje",
                      style: AppTheme.typography.headline3,
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.only(top: 48),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                childAspectRatio: 2.1 / 1,
                children: [
                  ...(kitchenTypes).map((e) {
                    return SelectBox(
                      text: e["label"],
                      isHighlighted: selectedKitchenTypes[e["name"]],
                      onClick: () {
                        setState(() {
                          selectedKitchenTypes[e["name"]] =
                              !selectedKitchenTypes[e["name"]];
                        });
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
