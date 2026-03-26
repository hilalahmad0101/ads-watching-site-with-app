import 'package:flutter/material.dart';
import '../res/colors/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isGradient;
  final double? width;
  final double height;
  final Color? color;
  final Color? textColor;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.isGradient = true,
    this.width,
    this.height = 56.0,
    this.color,
    this.textColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: isGradient ? AppColors.primaryGradient : null,
        color: !isGradient ? (color ?? AppColors.surfaceContainerHighest) : null,
        boxShadow: isGradient
            ? [
                BoxShadow(
                  color: AppColors.primaryContainer.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 8),
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: isLoading 
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: textColor ?? AppColors.onPrimary,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      text,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: textColor ?? (isGradient ? AppColors.onPrimary : AppColors.onSurface),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
