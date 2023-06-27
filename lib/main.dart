import 'package:flutter/material.dart';
import 'package:new_chat_app/features/chat_feature/presentation/controllers/chatting_provider.dart';
import 'package:new_chat_app/features/home_page/home_page.dart';
import 'package:new_chat_app/features/home_page/presentation/controllers/home_provider.dart';
import 'package:new_chat_app/features/login_register/presentation/controllers/auth_provider.dart';

import 'package:provider/provider.dart';

import 'features/login_register/presentation/controllers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ChattingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: HomePage(userEmail: 'bikram@gmail.com'),
      ),
    );
  }
}
