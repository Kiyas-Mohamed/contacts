import 'package:flutter/material.dart';
import 'package:contacts/screens/subScreens/sub_settings_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4267B2),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildSettingOption(
              title: 'General Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SubSetting()),
                );
              },
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            _buildSettingOption(
              title: 'Privacy Settings',
              icon: Icons.lock,
              onTap: () {
                // Handle Privacy Settings onTap event
                // For example, navigate to Privacy Settings screen
              },
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            _buildSettingOption(
              title: 'Account Settings',
              icon: Icons.account_circle,
              onTap: () {
                // Handle Account Settings onTap event
                // For example, navigate to Account Settings screen
              },
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            _buildSettingOption(
              title: 'Help & Support',
              icon: Icons.help,
              onTap: () {
                // Handle Help & Support onTap event
                // For example, navigate to Help & Support screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blueGrey,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
