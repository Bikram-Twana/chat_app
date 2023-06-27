// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:new_chat_app/features/home_page/home_page.dart';
import 'package:new_chat_app/features/login_register/presentation/controllers/auth_provider.dart';
import 'package:new_chat_app/features/login_register/presentation/controllers/user_provider.dart';
import 'package:new_chat_app/features/login_register/presentation/pages/register_screen.dart';
import 'package:new_chat_app/utils/colors/app_color.dart';
import 'package:new_chat_app/utils/consts/text_form_field_styles.dart';
import 'package:new_chat_app/utils/validators/login_register_validator.dart';

class BuildLoginForm extends StatelessWidget {
  BuildLoginForm({
    Key? key,
    required this.context,
    required this.authProvider,
  }) : super(key: key);

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final BuildContext context;
  final AuthProvider authProvider;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "your-mail@email.com",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(Icons.email),
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
              hintText: "Password",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(Icons.lock),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  authProvider.changeVisibility();
                },
                icon: authProvider.isPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            obscureText: !context.read<AuthProvider>().isPasswordVisible,
            validator: Validators.passwordValidator,
            controller: passwordController,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (loginFormKey.currentState!.validate()) {
                  try {
                    // await UserProvider().getUsers();
                    List<Map<String, dynamic>> temp = await context
                        .read<UserProvider>()
                        .getUser(emailController.text, passwordController.text);
                    if (emailController.text == temp[0]["email"] &&
                        passwordController.text == temp[0]["password"]) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => HomePage(
                                    userEmail: temp[0]["email"],
                                  )),
                          (route) => false);
                    }
                  } catch (e) {
                    print("No User Registered");
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Sign in",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                      (route) => false);
                },
                child: const Text(
                  "Sign up",
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
