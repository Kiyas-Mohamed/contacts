import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts/widgets/theme_widget.dart';

class SubSetting extends StatelessWidget {
  const SubSetting({Key? key}) : super(key: key);

  void _showAppearanceModal(BuildContext context) {
    final theme = Provider.of<AppTheme>(context, listen: false);

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: theme.isDarkMode
                    ? const Icon(Icons.radio_button_checked,
                        color: Color(0xFF4267B2))
                    : null,
                onTap: () {
                  theme.setDarkMode(true);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: const Text('Light Mode'),
                trailing: !theme.isDarkMode
                    ? const Icon(Icons.radio_button_checked,
                        color: Color(0xFF4267B2))
                    : null,
                onTap: () {
                  theme.setDarkMode(false);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sub Settings',
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
            ListTile(
              leading: const Icon(Icons.brush),
              title: const Text('Appearance'),
              onTap: () {
                _showAppearanceModal(context);
              },
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
