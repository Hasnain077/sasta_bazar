import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
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
              PopupMenuItem(child: Divider()),
              PopupMenuItem(
                onTap: () {},
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              PopupMenuItem(
                onTap: () async {
                  await LoginProvider().logout();
                },
                child: const Text("Sign Out"),
              )
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
            child: const Icon(
              Icons.arrow_drop_down,
              color: MyThem.drawerBackgroundColor,
            )),
        Visibility(visible: !isMain, child: profileImage()),
        Visibility(
            visible: !isMain,
            child: const SizedBox(
              height: 10,
            )),
        Column(
          crossAxisAlignment:
              isMain ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              "John ${isMain ? "Doe" : ""}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MyThem.drawerBackgroundColor),
            ),
            Text(
              user?.email ?? "",
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(visible: isMain, child: profileImage())
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
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Container(
              height: 8,
              width: 8,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
