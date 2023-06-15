import 'package:chat_app/auth/login_screen.dart';
import 'package:chat_app/models/providers/auth_provider.dart';
import 'package:chat_app/models/providers/user_provider.dart';
import 'package:chat_app/models/user/user_model.dart';
import 'package:chat_app/utils/colors/app_color.dart';
import 'package:chat_app/utils/consts/text_form_field_styles.dart';
import 'package:chat_app/utils/validators/login_register_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();

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
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "your-mail@email.com",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.email,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.emailValidator,
            controller: emailController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "username",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.person,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.usernameValidator,
            controller: usernameController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "full name",
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
            validator: Validators.nameValidator,
            controller: nameController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "phone number",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.phone,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.phoneValidator,
            controller: phoneController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            obscureText: context.read<AuthProvider>().isPasswordVisible,
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "password",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.lock,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<AuthProvider>().changeVisibility();
                },
                icon: Icon(
                  context.read<AuthProvider>().isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
            validator: Validators.passwordValidator,
            controller: passwordController,
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (registerFormKey.currentState!.validate()) {
                  context.read<UserProvider>().addUser(UserModel(
                      email: emailController.text,
                      userName: usernameController.text,
                      fullName: nameController.text,
                      phoneNumber: phoneController.text,
                      password: passwordController.text));

                  Fluttertoast.showToast(
                      msg: "User Register Sucessfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Register",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
