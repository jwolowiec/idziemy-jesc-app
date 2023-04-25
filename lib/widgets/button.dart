import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';

class Button extends StatefulWidget {
  final String text;
  final VoidCallback? onClick;
  final String? variant;

  const Button(
      {Key? key, required this.text, this.onClick, this.variant = "primary"})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  double yOffset = 0;

  late AnimationController _clickAnimationController;

  @override
  void initState() {
    _clickAnimationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 3.0,
      duration: const Duration(milliseconds: 50),
    );

    _clickAnimationController.addListener(() {
      setState(() {
        yOffset = _clickAnimationController.value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, yOffset),
      child: Container(
        decoration: BoxDecoration(
          color: widget.variant == "primary"
              ? AppTheme.colors.primary.shade500
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: widget.variant == "primary"
                  ? AppTheme.colors.primary.shade600.withOpacity(.75)
                  : Colors.transparent,
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: widget.variant == "primary"
                ? AppTheme.colors.primary.shade600
                : Colors.transparent,
            splashColor: widget.variant == "primary"
                ? AppTheme.colors.primary.shade600
                : Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            onTap: widget.onClick,
            onHighlightChanged: (isHighlighted) {
              if (isHighlighted) {
                _clickAnimationController.forward();
              } else {
                _clickAnimationController.reverse();
              }
            },
            child: Container(
              padding: widget.variant == "primary"
                  ? const EdgeInsets.symmetric(horizontal: 36, vertical: 10)
                  : const EdgeInsets.all(0),
              child: Text(
                widget.text,
                style: AppTheme.typography.button!.copyWith(
                  color: widget.variant == "primary"
                      ? AppTheme.colors.textPrimary
                      : AppTheme.colors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
