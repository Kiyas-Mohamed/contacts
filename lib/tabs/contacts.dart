import 'package:flutter/material.dart';
import 'package:contacts/models/user_models.dart';
import 'package:contacts/screens/subScreens/single_user_screen.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userModels.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            const Divider(
              height: 1,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleUserScreen(
                      name: userModels[index].name,
                      about: userModels[index].about,
                      phone: userModels[index].phone,
                      email: userModels[index].email,
                      avatar: userModels[index].avatar,
                      lastScene: userModels[index].lastScene,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: AssetImage(userModels[index].avatar),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      userModels[index].name,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  userModels[index].about,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.video_call),
                      color: Colors.blue[500],
                      onPressed: () {
                        return;
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      color: Colors.green[700],
                      onPressed: () {
                        // Handle phone call button press
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
