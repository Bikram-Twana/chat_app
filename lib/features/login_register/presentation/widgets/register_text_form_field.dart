import 'package:flutter/material.dart';
import 'package:new_chat_app/utils/colors/app_color.dart';
import 'package:new_chat_app/utils/consts/text_form_field_styles.dart';

class RegisterTextFormField extends StatelessWidget {
  const RegisterTextFormField({
    super.key,
    required this.nameController,
    required this.hintText,
    required this.validator,
  });

  final TextEditingController nameController;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
        radius: 6.0,
      ).copyWith(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.primaryColor.withOpacity(0.2),
        prefixIcon: const Icon(
          Icons.perm_identity_rounded,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
      validator: validator,
      controller: nameController,
    );
  }
}
