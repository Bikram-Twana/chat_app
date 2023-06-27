// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:new_chat_app/features/chat_feature/presentation/pages/chatting_page.dart';
import 'package:new_chat_app/features/home_page/presentation/controllers/home_provider.dart';
import 'package:new_chat_app/utils/consts/user_image.dart';

class MessageTab extends StatelessWidget {
  final String userEmail;
  MessageTab({
    Key? key,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    List<Map<String, dynamic>> allReceivingUsers =
        homeProvider.getAllReceivingUserList(userEmail);

    final fullSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          //Stories Profile
          Row(
            children: [
              //Add Your Story
              Column(
                children: [
                  Container(
                    height: 50.0,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                    child: ClipOval(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text("Your Story"),
                ],
              ),
              Container(
                width: fullSize.width - 75,
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allProfileImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container();
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(allProfileImages[index]),
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text('Story'),
                        ],
                      );
                    }),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: allReceivingUsers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.green),
                    title: Text("${allReceivingUsers[index]["fullName"]}"),
                    subtitle: Text("This is a message"),
                    trailing: Column(
                      children: [
                        Text("3m ago"),
                        Text("Typing..."),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChattingPage(
                                  anotherUserFullName:
                                      '${allReceivingUsers[index]["fullName"]}',
                                  anotherUserEmail:
                                      '${allReceivingUsers[index]["email"]}',
                                  loggedUserEmail: '$userEmail',
                                )));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
