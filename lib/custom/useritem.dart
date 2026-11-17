import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randomuser/main.dart';
import 'package:randomuser/models/user_model.dart';

class Custom extends StatelessWidget {
  UserModel user;

  Custom({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(userModel: user)),
        ),
      },
      child: Card(
        child: ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: Image.network(user.url),
        ),
      ),
    );
  }
}
