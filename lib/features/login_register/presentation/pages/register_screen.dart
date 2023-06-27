import 'package:flutter/material.dart';
import 'package:new_chat_app/features/login_register/presentation/widgets/build_register_form.dart';
import 'package:new_chat_app/utils/colors/app_color.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(context),
            _buildFormSection(context),
          ],
        ),
      ),
    );
  }

  _buildTopSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register your \nAccount",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12.0),
            Text(
              "Register your new account",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFormSection(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: _buildRegisterForm(context),
        ),
      ),
    );
  }

  _buildRegisterForm(BuildContext context) {
    return BuildRegisterForm();
  }
}
