import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Frequently Asked Questions',
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
            FAQItem(
              question: 'What is a contact app?',
              answer:
                  'A contact app is a mobile or computer application that helps you store and manage your contact information in a digital format.',
              subanswers: const [],
            ),
            FAQItem(
              question: 'How do I add a new contact to the app?',
              answer:
                  'To add a new contact to a contact app, follow these general steps:',
              subanswers: const [
                "1. Open the contact app on your device.",
                "2. Look for an option like 'Add Contact' or a '+' symbol within the app's interface. Tap on it.",
                "3. You will be prompted to enter the contact's details. Typically, you will need to provide at least the person's name and phone number. Other information like email address, address, and additional notes may also be available fields.",
                "4. Fill in the required information in the corresponding fields. You can tap or select each field to enter the data.",
                "5. Optionally, you can add more information, such as a photo, job title, organization, or any other relevant details, depending on the capabilities of the app.",
                "6. Once you have entered all the necessary information, look for a 'Save' or 'Done' button and tap on it to save the contact.",
                "7. The app will typically return you to the main contact list, where you should now see the newly added contact."
              ],
            ),
            FAQItem(
              question:
                  'How secure is the contact app? Is my contact data protected?',
              answer:
                  'The level of security and data protection in a contact app can vary depending on the specific app you are using. However, many contact apps prioritize the security and privacy of user data.',
              subanswers: const [
                "1. Encryption: Contact apps often use encryption to protect your contact data. This means that your data is encoded and can only be accessed with the appropriate encryption key, making it difficult for unauthorized parties to intercept or read your information.",
                "2. Access controls: Contact apps may offer features like password protection, fingerprint or facial recognition, or other authentication methods to prevent unauthorized access to your contact data. These measures add an extra layer of security to the app.",
                "3. Data storage: Contact apps may store your data either locally on your device or in the cloud. Cloud storage may offer additional security features like data encryption and regular backups to protect against data loss.",
                "4. Privacy policies: Reputable contact apps typically have privacy policies that outline how they handle and protect your contact data. It's important to review the privacy policy of the app you are using to understand how your data is collected, stored, and used.",
                "5. Privacy policies: Reputable contact apps typically have privacy policies that outline how they handle and protect your contact data. It's important to review the privacy policy of the app you are using to understand how your data is collected, stored, and used."
              ],
            ),
            FAQItem(
              question:
                  'Can I sync my contacts with other apps or services email, social media?',
              answer:
                  'Yes, many contact apps allow you to sync your contacts with other apps or services, including email and social media platforms.',
              subanswers: const [
                "1. Open the settings or preferences menu of your contact app.",
                "2. Look for an option like 'Sync Contacts' or 'Account Sync.'",
                "3. Tap on the option and you will likely see a list of compatible apps or services that you can sync your contacts with.",
                "4. Choose the apps or services you want to sync your contacts with. This can include popular email providers like Gmail, Outlook, or Yahoo, as well as social media platforms such as Facebook, LinkedIn, or Twitter.",
                "5. Follow the prompts to authorize the connection between the contact app and the selected apps or services. This may involve signing in to your accounts or granting permissions.",
                "6. Once the sync is set up, the contact app will automatically transfer and update your contacts between the different platforms. Any changes you make to a contact in one synced app or service will reflect in the contact app and vice versa."
              ],
            ),
            FAQItem(
              question: 'What should I do if the app crashes or freezes?',
              answer:
                  "Close and reopen the app Sometimes, closing the app completely and reopening it can resolve minor glitches or temporary issues. Swipe the app off the screen or use your device's app switcher to close the app. Then, relaunch it and check if the problem persists.",
              subanswers: const [
                '1. Make sure your device has enough storage space.',
                '2. Update the app to the latest version.'
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;
  final List<String> subanswers;

  // ignore: prefer_const_constructors_in_immutables
  FAQItem(
      {Key? key,
      required this.question,
      required this.answer,
      required this.subanswers})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onExpansionChanged: (value) {
          setState(() {
            _expanded = value;
          });
        },
        trailing: _expanded
            ? const Icon(Icons.remove) // Minus icon
            : const Icon(Icons.add), // Plus icon
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.answer,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                if (widget.subanswers.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Subanswers:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (var i = 0; i < widget.subanswers.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  // ignore: unnecessary_string_interpolations
                                  text: '${widget.subanswers[i]}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                if (i != widget.subanswers.length - 1)
                                  const TextSpan(text: '\n'), // Line break
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: FAQScreen(),
  ));
}
