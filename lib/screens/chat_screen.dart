import 'package:flutter/material.dart';
import 'package:contacts/models/user_models.dart';
import 'package:contacts/widgets/search_widget.dart';
import 'package:contacts/screens/subScreens/single_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF4267B2),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchWidget(),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String option) {
              // Handle selected option from the popup menu
              if (option == 'sort') {
                // Handle Sort By option
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'sort',
                child: ListTile(
                  leading: const Icon(Icons.sort),
                  title: const Text('Sort'),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_right),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'name',
                        child: Text('Name'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'dateCreated',
                        child: Text('Date Created'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'dateUpdated',
                        child: Text('Date Updated'),
                      ),
                      // Add more options as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userModels.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              const Divider(
                height: 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleChatScreen(
                        index: index,
                        name: userModels[index].name,
                        avatar: userModels[index].avatar,
                        lastScene: userModels[index].lastScene,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: AssetImage(
                        userModels[index].avatar,
                      ),
                    ),
                    title: Text(
                      userModels[index].name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.message),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleChatScreen(
                              index: index,
                              name: userModels[index].name,
                              avatar: userModels[index].avatar,
                              lastScene: userModels[index].lastScene,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
