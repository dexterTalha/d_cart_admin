import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/mytheme.dart';

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30, top: 10, bottom: 10),
      child: GestureDetector(
        onTapDown: (details) {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(
              details.globalPosition.dx,
              60,
              details.globalPosition.dx,
              details.globalPosition.dy,
            ),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            items: [
              PopupMenuItem(
                child: profileNameAndImage(isMain: false),
              ),
              PopupMenuItem(
                child: Container(
                  height: 30,
                  color: Colors.green,
                  width: double.maxFinite,
                ),
              ),
            ],
          );
        },
        child: profileNameAndImage(),
      ),
    );
  }

  Widget profileNameAndImage({bool isMain = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isMain,
          child: const Icon(Icons.arrow_drop_down, color: MyTheme.drawerBackgroundColor),
        ),
        Visibility(
          visible: !isMain,
          child: profileImage(),
        ),
        Visibility(
          visible: !isMain,
          child: const SizedBox(width: 10),
        ),
        Column(
          crossAxisAlignment: isMain ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            const Text(
              "John Doe",
              style: TextStyle(fontWeight: FontWeight.bold, color: MyTheme.drawerBackgroundColor),
            ),
            Text(
              user?.email ?? "",
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Visibility(
          visible: isMain,
          child: profileImage(),
        ),
      ],
    );
  }

  Widget profileImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.asset("assets/png/user_image.png"),
          ),
        ),
        Positioned(
          right: 2,
          bottom: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: 8,
              width: 8,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
