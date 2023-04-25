import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/main_bottom_navigation.dart';
import 'package:idziemy_jesc/widgets/button.dart';

class TogetherStartScreen extends StatelessWidget {
  static const routeName = "/together/start";

  const TogetherStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigation(
        routeName: routeName,
        selectedIndex: 2,
      ),
      body: Padding(
        padding: AppTheme.spacing.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Image.asset('assets/images/logo.png', width: 120, height: 120),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Idziemy jeść ", style: AppTheme.typography.headline2),
                Text(
                  "Razem",
                  style: AppTheme.typography.headline2!.copyWith(
                    color: AppTheme.colors.primary.shade500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Chcesz zjeść z ziomalami, ale nie masz ziomali? Od teraz to nie problem! W Idziemy jeść Razem znajdziesz ludzi, którzy tak jak ty są przegrywami życiowymi i też są głodni! Pokaż innym, że nie umiesz w życie rejestrując się do najnowszej funkcji",
                style: AppTheme.typography.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            const Button(
              text: "Zaczynamy!",
            )
          ],
        ),
      ),
    );
  }
}
