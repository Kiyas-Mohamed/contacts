import 'package:flutter/material.dart';
import 'package:contacts/models/user_models.dart';
import 'package:contacts/screens/subScreens/single_user_screen.dart';

class SingleChatScreen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int index;
  final String name;
  final String avatar;
  final String lastScene;

  const SingleChatScreen({
    Key? key,
    required this.index,
    required this.name,
    required this.avatar,
    required this.lastScene,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF4267B2),
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: _appBar(context),
          actions: [
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Handle the call button pressed
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String option) {
                // Handle selected option from the popup menu
                if (option == 'view') {
                  // Handle view option
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'view',
                  child: ListTile(
                    title: const Text('View'),
                    leading: const Icon(Icons.visibility),
                    onTap: () {
                      // Handle the call button pressed
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
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "You haven't chatted anything yet",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle emoji picker icon pressed
                    },
                    icon: const Icon(Icons.emoji_emotions),
                    color: const Color(0xFF4267B2),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12.0,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle voice message recorder icon pressed
                    },
                    icon: const Icon(Icons.keyboard_voice),
                    color: const Color(0xFF4267B2),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle files icon pressed
                    },
                    icon: const Icon(Icons.attach_file),
                    color: const Color(0xFF4267B2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 43.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 22.0,
            backgroundColor: Colors.blueGrey,
            backgroundImage: AssetImage(avatar),
          ),
          const SizedBox(width: 7.0),
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16.5, color: Colors.white),
                  ),
                  const SizedBox(height: 0.5),
                  Text(
                    lastScene,
                    style: const TextStyle(fontSize: 13.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
