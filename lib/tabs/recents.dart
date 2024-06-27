import 'package:flutter/material.dart';
import 'package:contacts/models/user_models.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userModels.length,
      itemBuilder: (context, index) {
        final bool isMissedCall =
            userModels[index].callType == CallType.missed.toString();
        Color iconColor_1 = isMissedCall ? Colors.red : Colors.green;

        return Column(
          children: <Widget>[
            const Divider(
              height: 1,
            ),
            InkWell(
              onTap: () {
                return;
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: AssetImage(userModels[index].avatar),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      userModels[index].name,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      userModels[index].time,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: isMissedCall ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  userModels[index].phone,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      isMissedCall ? Icons.call_missed : Icons.call_made,
                      color: iconColor_1,
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
