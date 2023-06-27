import 'package:flutter/material.dart';
import 'package:new_chat_app/localization/database_service.dart';
import 'package:new_chat_app/features/login_register/domain/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  //adding user from registration
  void addUser(UserModel user) async {
    DatabaseService.instance.addUser(user);
    // getUsers();
  }

  //getting matched user from login
  Future<List<Map<String, dynamic>>> getUser(
      String email, String password) async {
    return DatabaseService.instance.getSingleUser(email, password);
  }

  // Future<List<Map<String, dynamic>>> getRecevingUserList(String email) async {
  //   return DatabaseService.instance.allReceivingUsers(email);
  // }

  // //changing Future<List<Map<String,dynamic>>> to List<Map<String,dynamic>>
  // List<Map<String, dynamic>> getAllReceivingUserList(String email) {
  //   DatabaseService.instance.allReceivingUsers(email).then((value) => {
  //         if (value.isNotEmpty)
  //           {
  //             value.forEach((element) => _allReceivingUsers.add(element)),
  //           },
  //         if (_allReceivingUsers.isNotEmpty) _allReceivingUsers.clear(),
  //         if (value.isNotEmpty)
  //           {value.forEach((element) => _allReceivingUsers.add(element))},
  //       });
  //   return _allReceivingUsers.isEmpty ? [] : _allReceivingUsers;
  // }
}
