import 'package:ecommerce/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
  });

  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? errorText;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isObscure;
  @override
  initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  void toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        errorText: widget.errorText,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  toggleObscure();
                },
                icon: isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,

        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.grey100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.grey100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.grey100),
        ),
      ),
    );
  }
}
