import 'package:flutter/material.dart';
import 'package:contacts/tabs/contacts.dart';
import 'package:contacts/tabs/favorites.dart';
import 'package:contacts/tabs/recents.dart';
import 'package:contacts/widgets/dialpad_widget.dart';
import 'package:contacts/widgets/search_widget.dart';
import 'package:contacts/screens/chat_screen.dart';
import 'package:contacts/screens/setting_screen.dart';
import 'package:contacts/screens/faq_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.white),
        ),
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
                // Implement the logic to sort contacts
              } else if (option == 'importExport') {
                // Handle Import/Export option
                // Implement the logic to import/export contacts
              } else if (option == 'notifications') {
                // Handle Notifications option
                // Implement the logic for managing notifications
              } else if (option == 'syncBackup') {
                // Handle Sync and Backup option
                // Implement the logic for syncing and backing up contacts
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
              const PopupMenuItem<String>(
                value: 'importExport',
                child: SizedBox(
                  // height: 40, // Adjust the height as desired
                  child: ListTile(
                    leading: Icon(Icons.import_export),
                    title: Text('Import/Export'),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'notifications',
                child: SizedBox(
                  // height: 40, // Adjust the height as desired
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'syncBackup',
                child: SizedBox(
                  // height: 40, // Adjust the height as desired
                  child: ListTile(
                    leading: Icon(Icons.sync),
                    title: Text('Sync and Backup'),
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Favorites'),
            Tab(text: 'Recents'),
            Tab(text: 'Contacts'),
          ],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 6.0),
          labelStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 15.0),
        ),
      ),
      drawer: Drawer(
        elevation: 15.0,
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Kiyas Mohamed',
                style: TextStyle(fontSize: 19.0),
              ),
              accountEmail: Text(
                'darkdoor77@gmail.com',
                style: TextStyle(fontSize: 14.0),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/me_v1.jpg'),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF4267B2),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text(
                    'FAQs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  leading: const Icon(
                    Icons.help,
                    color: Colors.blueGrey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FAQScreen()),
                    );
                  },
                ),
                const Divider(
                  height: 0.1,
                  color: Colors.blueGrey,
                ),
                ListTile(
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScreen()),
                    );
                  },
                ),
                const Divider(
                  height: 0.1,
                  color: Colors.blueGrey,
                ),
                const ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  leading: Icon(
                    Icons.info,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Message',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomeScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ),
            );
          }
        },
        selectedItemColor: const Color(0xFF4267B2),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Favorites(),
          Recents(),
          Contacts(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_tabController.index == 0) {
            // Handle Favorites tab action
            // For example, make a phone call to the favorite contact
          } else if (_tabController.index == 1) {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return DialpadWidget(
                  onNumberPressed: (number) {
                    // ignore: avoid_print
                    print('Number: $number');
                    // Perform desired actions with the number, such as dialing.
                  },
                  onCallPressed: () {
                    // Handle call button pressed
                    // For example, initiate a phone call with the entered number
                  },
                );
              },
            );
          } else if (_tabController.index == 2) {
            // Handle Contacts tab action
            // For example, open the add contact screen
          }
        },
        backgroundColor: const Color(0xFF4267B2),
        child: Icon(
          _tabController.index == 0
              ? Icons.person_2
              : _tabController.index == 1
                  ? Icons.dialpad
                  : _tabController.index == 2
                      ? Icons.add
                      : null,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
