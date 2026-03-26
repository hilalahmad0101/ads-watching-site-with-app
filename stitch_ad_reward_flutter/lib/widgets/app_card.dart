import 'package:flutter/material.dart';
import '../res/colors/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Border? border;
  final bool showShadow;

  const AppCard({
    super.key,
    required this.child,
    this.color,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(16.0),
    this.border,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border ?? Border.all(color: AppColors.onSurfaceVariant.withOpacity(0.05)),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            : null,
      ),
      padding: padding,
      child: child,
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? percentage;
  final bool isMain;
  final double? progress;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.percentage,
    this.isMain = false,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: isMain ? AppColors.surfaceContainer : AppColors.surfaceContainerLow,
      border: isMain ? const Border(left: BorderSide(color: AppColors.primary, width: 4)) : null,
      child: Stack(
        children: [
          if (isMain)
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          letterSpacing: 2.0,
                        ),
                  ),
                  if (icon != null)
                    Icon(
                      icon,
                      color: AppColors.primary,
                      size: 16,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value,
                    style: (isMain ? Theme.of(context).textTheme.headlineMedium : Theme.of(context).textTheme.titleLarge)?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  if (percentage != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      percentage!,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ],
              ),
              if (progress != null) ...[
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 4,
                    backgroundColor: AppColors.surfaceContainerHighest,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
