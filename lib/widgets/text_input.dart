import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTheme.typography.bodyText1!.copyWith(),
      decoration: InputDecoration(
        label: Text(
          label,
          style: AppTheme.typography.bodyText2!.copyWith(),
        ),
        filled: true,
        fillColor: AppTheme.colors.gray.shade800.withOpacity(.5),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppTheme.colors.gray.shade600, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppTheme.colors.primary.shade500, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}