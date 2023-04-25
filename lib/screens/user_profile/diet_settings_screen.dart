import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';

import 'account_main_screen.dart';

class DietSettingsScreen extends StatefulWidget {
  static const routeName = "/restaurants/diet-settings";

  const DietSettingsScreen({Key? key}) : super(key: key);

  @override
  State<DietSettingsScreen> createState() => _DietSettingsScreenState();
}

class _DietSettingsScreenState extends State<DietSettingsScreen> {
  Map selectedDietsSettings = {
    "vegetarian": false,
    "vegan": false,
    "ketogenic": false,
    "glutenFree": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.appBackground,
        elevation: 0,
        title: Text("Diety", style: AppTheme.typography.headline5),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: GestureDetector(
            onTap: () {
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
                  Container(
                    child: Text(
                      "Profil",
                      style: TextStyle(
                        color: AppTheme.colors.gray,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: AppTheme.spacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: SelectBox(
                      text: "Wegetariańska",
                      isHighlighted: selectedDietsSettings["vegetarian"],
                      onClick: () {
                        setState(() {
                          selectedDietsSettings["vegetarian"] =
                              !selectedDietsSettings["vegetarian"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    child: SelectBox(
                      text: "Wegańska",
                      isHighlighted: selectedDietsSettings["vegan"],
                      onClick: () {
                        setState(() {
                          selectedDietsSettings["vegan"] =
                              !selectedDietsSettings["vegan"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    child: SelectBox(
                      text: "Ketogeniczna",
                      isHighlighted: selectedDietsSettings["ketogenic"],
                      onClick: () {
                        setState(() {
                          selectedDietsSettings["ketogenic"] =
                              !selectedDietsSettings["ketogenic"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    child: SelectBox(
                      text: "Bezglutenowa",
                      isHighlighted: selectedDietsSettings["glutenFree"],
                      onClick: () {
                        setState(() {
                          selectedDietsSettings["glutenFree"] =
                              !selectedDietsSettings["glutenFree"];
                        });
                      },
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
