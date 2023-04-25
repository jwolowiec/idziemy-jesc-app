import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';
import 'package:idziemy_jesc/screens/register/register_diet_screen.dart';

class RegisterPreferencesScreen extends StatefulWidget {
  static const routeName = "/register/preferences";

  const RegisterPreferencesScreen({Key? key}) : super(key: key);

  @override
  _RegisterPreferencesScreenState createState() =>
      _RegisterPreferencesScreenState();
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

class _RegisterPreferencesScreenState extends State<RegisterPreferencesScreen> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Text(
                    "Krok 1",
                    style: AppTheme.typography.bodyText1!.copyWith(
                      color: AppTheme.colors.gray.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Co lubisz jeść?",
                  style: AppTheme.typography.headline2,
                )
              ],
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
                          selectedKitchenTypes[e["name"]] = !selectedKitchenTypes[e["name"]];
                        });
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                    text: "Powrót",
                    variant: "tertiary",
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Button(
                      text: "Dalej",
                      onClick: () {
                        Navigator.of(context)
                            .pushNamed(RegisterDietScreen.routeName);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
