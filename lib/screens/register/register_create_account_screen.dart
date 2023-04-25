import 'package:flutter/material.dart';
import 'package:idziemy_jesc/provider/auth.dart';
import 'package:idziemy_jesc/screens/register/register_finish_screen.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/button.dart';
import 'package:idziemy_jesc/widgets/select_box.dart';
import 'package:provider/provider.dart';

class RegisterCreateAccountScreen extends StatefulWidget {
  static const routeName = "/register/create-account";

  const RegisterCreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<RegisterCreateAccountScreen> createState() =>
      _RegisterCreateAccountScreenState();
}

class _RegisterCreateAccountScreenState
    extends State<RegisterCreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppTheme.spacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeading(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    child: const SelectBox(
                      text: "Rejestracja przez Google",
                    ),
                    onTap: () async {
                      final provider = Provider.of<AuthProvider>(
                          context,
                          listen: false);

                      await provider.googleLogin();
                      Navigator.of(context)
                          .pushNamed(RegisterFinishScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Button(
                    text: "Kontynuuj bez zakładania konta",
                    variant: "tertiary",
                    onClick: () {
                      Navigator.of(context)
                          .pushNamed(RegisterFinishScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Button(
                    text: "Mam już konto",
                    variant: "tertiary",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Button(
                    text: "Powrót",
                    variant: "tertiary",
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buildHeading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Text(
            "Krok 3",
            style: AppTheme.typography.bodyText1!.copyWith(
              color: AppTheme.colors.gray.shade500,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "Wszystko prawie gotowe, czas na stworzenie konta.",
          style: AppTheme.typography.headline2,
        )
      ],
    );
  }
}
