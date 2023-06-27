//
import 'package:flutter/material.dart';
import 'package:new_chat_app/features/login_register/presentation/controllers/auth_provider.dart';
import 'package:new_chat_app/features/login_register/presentation/widgets/build_login_form.dart';
import 'package:new_chat_app/features/login_register/presentation/widgets/build_top_section.dart';
import 'package:new_chat_app/utils/colors/app_color.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, value, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BuildTopSection(context: context),
              _buildFormSection(context, value),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildFormSection(BuildContext context, AuthProvider authProvider) {
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
          child: BuildLoginForm(context: context, authProvider: authProvider),
        ),
      ),
    );
  }
}
