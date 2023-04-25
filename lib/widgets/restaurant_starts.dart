import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class RestaurantStars extends StatelessWidget {
  const RestaurantStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIcon(),
        buildIcon(),
        buildIcon(),
        buildIcon(),
        Icon(
          Icons.star,
          color: AppTheme.colors.gray.shade500,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          "(243)",
          style: AppTheme.typography.bodyText2!.copyWith(
            fontSize: 10,
            height: 2,
            color: AppTheme.colors.textSecondary.withOpacity(.75),
          ),
        )
      ],
    );
  }

  Icon buildIcon() {
    return Icon(
        Icons.star,
        color: AppTheme.colors.primary.shade500,
        size: 16,
      );
  }
}