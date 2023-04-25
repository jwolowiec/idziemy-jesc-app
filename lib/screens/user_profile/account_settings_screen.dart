import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/main_bottom_navigation.dart';
import 'package:idziemy_jesc/widgets/text_input.dart';

import 'account_main_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  static const routeName = "/restaurants/account-settings";

  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.appBackground,
        elevation: 0,
        title: Text("Konto", style: AppTheme.typography.headline5),
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
      body: Container(
        padding: AppTheme.spacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const TextInput(label: "John"),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Data urodzenia"),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: SmartSelect<String>.single(
                          choiceLayout: S2ChoiceLayout.grid,
                          choiceGridCount: 5,
                          choiceGridSpacing: 10,
                          choiceBuilder: (BuildContext context,
                              S2SingleState<String?> state,
                              S2Choice<String?> choice) {
                            return buildSelectChoice(choice);
                          },
                          tileBuilder: (context, state) {
                            return buildSelectTile(state, "Dzień");
                          },
                          modalHeaderBuilder: (BuildContext context,
                              S2SingleState<String?> state) {
                            return buildSelectModalHeader(state);
                          },
                          modalType: S2ModalType.popupDialog,
                          modalStyle: buildModalStyle(),
                          title: "Dzień",
                          selectedValue: "3",
                          choiceItems: [
                            ...[for (var i = 1; i < 31; i += 1) i].map(
                              (int value) => (S2Choice(
                                  value: value.toString(),
                                  title: value.toString())),
                            )
                          ],
                          onChange: (_) => {},
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        flex: 3,
                        child: SmartSelect<String>.single(
                          choiceBuilder: (BuildContext context,
                              S2SingleState<String?> state,
                              S2Choice<String?> choice) {
                            return buildSelectChoice(
                              choice,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 18,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              isCentered: false,
                            );
                          },
                          tileBuilder: (context, state) {
                            return buildSelectTile(state, "Miesiąc");
                          },
                          modalType: S2ModalType.popupDialog,
                          modalHeaderBuilder: (BuildContext context,
                              S2SingleState<String?> state) {
                            return buildSelectModalHeader(state);
                          },
                          modalStyle: buildModalStyle(),
                          title: "Miesiąc",
                          selectedValue: "Maj",
                          choiceItems: [
                            ...[
                              "Styczeń",
                              "Luty",
                              "Marzec",
                              "Kwiecień",
                              "Maj",
                              "Czerwiec",
                              "Lipiec",
                              "Sierpień",
                              "Wrzesień",
                              "Październik",
                              "Listopad",
                              "Grudzień"
                            ].map(
                              (String value) => (S2Choice(
                                  value: value.toString(),
                                  title: value.toString())),
                            )
                          ],
                          onChange: (_) => {},
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        flex: 2,
                        child: SmartSelect<String>.single(
                          choiceLayout: S2ChoiceLayout.grid,
                          choiceGridCount: 4,
                          choiceGridSpacing: 10,
                          tileBuilder: (context, state) {
                            return buildSelectTile(state, "Rok");
                          },
                          modalHeaderBuilder: (BuildContext context,
                              S2SingleState<String?> state) {
                            return buildSelectModalHeader(state);
                          },
                          choiceBuilder: (BuildContext context,
                              S2SingleState<String?> state,
                              S2Choice<String?> choice) {
                            return buildSelectChoice(
                              choice,
                            );
                          },
                          modalStyle: buildModalStyle(),
                          modalType: S2ModalType.popupDialog,
                          title: "Rok",
                          selectedValue: "2003",
                          choiceItems: [
                            ...[for (var i = 2021; i >= 1900; i--) i].map(
                              (int value) => (S2Choice(
                                  value: value.toString(),
                                  title: value.toString())),
                            )
                          ],
                          onChange: (_) => {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Płeć"),
                  const SizedBox(
                    height: 6,
                  ),
                  SmartSelect<String>.single(
                    tileBuilder: (context, state) {
                      return buildSelectTile(state, "Wybierz płeć");
                    },
                    modalHeaderBuilder:
                        (BuildContext context, S2SingleState<String?> state) {
                      return buildSelectModalHeader(state);
                    },
                    choiceBuilder: (BuildContext context,
                        S2SingleState<String?> state,
                        S2Choice<String?> choice) {
                      return buildSelectChoice(
                        choice,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        isCentered: false,
                      );
                    },
                    modalType: S2ModalType.popupDialog,
                    modalStyle: buildModalStyle(),
                    title: "Wybierz płeć",
                    selectedValue: "Mężczyzna",
                    choiceItems: [
                      ...["Mężczyzna", "Kobieta"].map(
                        (String value) => (S2Choice(
                            value: value.toString(), title: value.toString())),
                      )
                    ],
                    onChange: (_) => {},
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Usuwanie konta",
                        style: AppTheme.typography.headline6,
                      ),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: AppTheme.colors.gray)),
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                      color: AppTheme.colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  S2ModalStyle buildModalStyle() {
    return S2ModalStyle(
      backgroundColor: AppTheme.colors.appBackgroundSecondary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 1,
          color: AppTheme.colors.gray.shade700,
        ),
      ),
    );
  }

  Container buildSelectModalHeader(S2SingleState<String?> state) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppTheme.colors.gray.shade700),
        ),
      ),
      child: Text(
        state.title.toString(),
        style: AppTheme.typography.headline2!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppTheme.colors.gray.shade200,
          fontSize: 20,
        ),
      ),
    );
  }

  GestureDetector buildSelectTile(S2SingleState<String?> state, String label) {
    return GestureDetector(
      onTap: state.showModal,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.colors.gray.shade800.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.colors.gray.shade600,
            width: 2,
          ),
        ),
        child: Text(
          state.selected.toString() == "Select one"
              ? label
              : state.selected.toString(),
        ),
      ),
    );
  }

  GestureDetector buildSelectChoice(S2Choice<String?> choice,
      {EdgeInsets? padding, EdgeInsets? margin, bool? isCentered = true}) {
    return GestureDetector(
      onTap: () => choice.select!(true),
      child: Container(
        padding: padding ?? const EdgeInsets.all(0),
        margin: margin ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: choice.selected
              ? AppTheme.colors.primary.shade500
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        alignment: isCentered! ? Alignment.center : Alignment.bottomLeft,
        child: Text(
          choice.value.toString(),
          style: AppTheme.typography.bodyText2!.copyWith(
              color: choice.selected
                  ? Colors.white
                  : AppTheme.colors.textSecondary),
        ),
      ),
    );
  }
}
