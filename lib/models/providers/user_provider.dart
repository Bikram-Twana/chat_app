// import 'package:chat_app/data/local_database.dart';
import 'package:chat_app/models/services/database_service.dart';
import 'package:chat_app/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late List<UserModel> _userList = [];
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
}
