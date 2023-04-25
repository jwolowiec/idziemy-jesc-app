import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/restaurant_starts.dart';

class RestaurantOpinion extends StatelessWidget {
  const RestaurantOpinion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.spacing.screenPadding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Lorem ipsum dolor sit",
              textAlign: TextAlign.left,
              style: AppTheme.typography.headline1,
            ),
          ),
          const RestaurantStars(),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Text(
              "Opinie",
              style: AppTheme.typography.headline6,
            ),
          ),
          opinion(),
          opinion(),
          opinion(),
        ],
      ),
    );
  }
}

Container opinion() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    width: double.infinity,
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
    decoration: BoxDecoration(
      color: AppTheme.colors.gray.shade800,
      borderRadius: BorderRadius.circular(AppTheme.mainBorderRadiusValue),
    ),
    child: Column(
      children: [
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at vulputate nulla.",
          style: AppTheme.typography.bodyText2,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(
            height: 3,
            color: AppTheme.colors.gray.shade500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: RestaurantStars(),
            )
          ],
        )
      ],
    ),
  );
}
