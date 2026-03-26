import 'package:flutter/material.dart';
import '../res/colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          style: const TextStyle(color: AppColors.onSurface, fontSize: 16),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Icon(prefixIcon, color: Colors.grey, size: 20),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColors.surfaceContainerLowest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.4)),
            ),
          ),
        ),
      ],
    );
  }
}
