import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class SelectBox extends StatelessWidget {
  final bool isHighlighted;
  final String text;
  final VoidCallback? onClick;

  const SelectBox({Key? key, this.onClick, this.isHighlighted = false, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.colors.appBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isHighlighted
                ? AppTheme.colors.primary.shade500
                : AppTheme.colors.gray.shade600,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isHighlighted
                  ? AppTheme.colors.primary.shade600.withOpacity(.65)
                  : AppTheme.colors.gray.shade700.withOpacity(.65),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppTheme.typography.bodyText2!.copyWith(
              fontWeight: FontWeight.w600,
              color: isHighlighted
                  ? AppTheme.colors.primary.shade500
                  : AppTheme.colors.gray.shade500,
            ),
          ),
        ),
      ),
    );
  }
}
