import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_quote_app/screens/login.dart";
import "package:my_quote_app/screens/profile.dart";
import "package:my_quote_app/utils/constants/text.dart";

import "../utils/constants/images.dart";

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 35, 5, 86),
      child: ListView(
        children: [
          //header
          DrawerHeader(
            child: Column(
              children: [
                Image.asset(
                  AppImage.splashImage2,
                  height: 80,
                ),
                const SizedBox(height: 2),
                Text(
                  QuoteString.appName,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ), //body
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
                //Home
                ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text("Home",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onTap: () {
                      Get.back();
                    }),

                const Divider(height: 10, thickness: 2, color: Colors.grey),
                ListTile(
                    leading: const Icon(Icons.picture_in_picture_alt_rounded,
                        color: Colors.white),
                    title: const Text("My Profile",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onTap: () {
                      Get.to(ProfilePage());
                    }),

                //LogOut

                const Divider(height: 10, thickness: 2, color: Colors.grey),
                ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.white),
                    title: const Text("LogOut",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Get.to(LoginPage());
                      /*   Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MySplashScreen()));
                   */
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
