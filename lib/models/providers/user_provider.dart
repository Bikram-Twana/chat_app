// import 'package:chat_app/data/local_database.dart';

import 'package:chat_app/models/services/database_service.dart';
import 'package:chat_app/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late List<UserModel> _userList = [];
  List<Map<String, dynamic>> _allReceivingUsers = [];

  // final LocalDB localDB;
  List<UserModel> get userModels => _userList;

  // UserProvider({required this.localDB});

  getUsers() async {
    await DatabaseService.instance.getAllUserModels().then((value) {
      _userList = value;
      notifyListeners();
    });
  }

  void addUser(UserModel user) async {
    DatabaseService.instance.addUser(user);
    getUsers();
  }

  Future<List<Map<String, dynamic>>> getUser(
      String email, String password) async {
    return DatabaseService.instance.getSingleUser(email, password);
  }

  // Future<List<Map<String, dynamic>>> getRecevingUserList(String email) async {
  //   return DatabaseService.instance.allReceivingUsers(email);
  // }

  //changing Future<List<Map<String,dynamic>>> to List<Map<String,dynamic>>
  List<Map<String, dynamic>> getAllReceivingUserList(String email) {
    DatabaseService.instance.allReceivingUsers(email).then((value) => {
          if (value.isNotEmpty)
            {
              value.forEach((element) => _allReceivingUsers.add(element)),
            },
          if (_allReceivingUsers.isNotEmpty) _allReceivingUsers.clear(),
          if (value.isNotEmpty)
            {value.forEach((element) => _allReceivingUsers.add(element))},
        });
    return _allReceivingUsers.isEmpty ? [] : _allReceivingUsers;
  }
}
