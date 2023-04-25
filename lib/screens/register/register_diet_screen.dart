import 'package:flutter/material.dart';
import 'package:idziemy_jesc/screens/register/register_user_data_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';

class RegisterDietScreen extends StatefulWidget {
  static const routeName = "/register/diet";

  const RegisterDietScreen({Key? key}) : super(key: key);

  @override
  _RegisterDietScreen createState() => _RegisterDietScreen();
}

class _RegisterDietScreen extends State<RegisterDietScreen> {
  Map selectedDiets = {
    "vegetarian": false,
    "vegan": false,
    "ketogenic": false,
    "glutenFree": false,
  };

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
                    "Krok 2",
                    style: AppTheme.typography.bodyText1!.copyWith(
                      color: AppTheme.colors.gray.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Czy stosujesz jakieś diety?",
                  style: AppTheme.typography.headline2,
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: SelectBox(
                      text: "Wegetariańska",
                      isHighlighted: selectedDiets["vegetarian"],
                      onClick: () {
                        setState(() {
                          selectedDiets["vegetarian"] =
                              !selectedDiets["vegetarian"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    child: SelectBox(
                      text: "Wegańska",
                      isHighlighted: selectedDiets["vegan"],
                      onClick: () {
                        setState(() {
                          selectedDiets["vegan"] = !selectedDiets["vegan"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    child: SelectBox(
                      text: "Ketogeniczna",
                      isHighlighted: selectedDiets["ketogenic"],
                      onClick: () {
                        setState(() {
                          selectedDiets["ketogenic"] =
                              !selectedDiets["ketogenic"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    child: SelectBox(
                      text: "Bezglutenowa",
                      isHighlighted: selectedDiets["glutenFree"],
                      onClick: () {
                        setState(() {
                          selectedDiets["glutenFree"] =
                              !selectedDiets["glutenFree"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
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
                            .pushNamed(RegisterUserDataScreen.routeName);
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
