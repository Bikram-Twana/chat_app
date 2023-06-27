import 'package:flutter/material.dart';
import 'package:new_chat_app/localization/database_service.dart';

class HomeProvider with ChangeNotifier {
  //Navbar current index
  int _index = 1;
  int get index => _index;

  void changeIndex(int index) {
    this._index = index;
    ChangeNotifier();
  }

  //User id from login
  int _userId = 0;
  set userId(int id) {
    _userId = id;
    ChangeNotifier();
  }

  int get userId => _userId;

  String? _senderEmail;
  String? _receiverEmail;
  String get senderEmail => _senderEmail ?? "";
  String get receiverEmail => _receiverEmail ?? "";

  set setSenderEmail(String senderEmail) {
    _senderEmail = senderEmail;
  }

  set setReceiverEmail(String receiverEmail) {
    _receiverEmail = receiverEmail;
  }

  //Get all receiving users
  List<Map<String, dynamic>> _allReceivingUsers = [];
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



// FutureBuilder(
//           future: provider.getUser(provideruser.userid),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasData) {
//               final data = snapshot.data;
//               return ListView.builder(
//                 itemCount: data!.length,
//                 itemBuilder: (context, index) {
//                   final user = data[index];
//                   return ListTile(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               ChatPageScreen(provideruser.userid, user.id)));
//                     },
//                     title: Text("${user.name}"),
//                     leading: CircleAvatar(
//                       backgroundImage: FileImage(
//                         File(user.imageUrl!),
//                       ),
//                       radius: 20,
//                     ),
//                   );
//                 },
//               );
//             }
//             return Center(child: Text("User list empty"));
//           },
//         )