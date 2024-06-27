import 'package:flutter/material.dart';
import 'package:contacts/models/user_models.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userModels.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  return;
                },
                child: ListTile(
                  onTap: () {
                    return;
                  },
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(userModels[index].avatar),
                  ),
                  title: Text(
                    userModels[index].name,
                    style: const TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    userModels[index].phone,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      return;
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
