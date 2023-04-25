import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [Container()],
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.colors.appBackground,
      elevation: 0,
      title: Builder(
        builder: (context) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: const Image(
                image: AssetImage("assets/images/logo.png"),
                height: 50,
                width: 94,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: AppTheme.colors.primary.shade500,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}