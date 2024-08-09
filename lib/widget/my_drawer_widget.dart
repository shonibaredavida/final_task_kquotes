import "package:final_task_kquotes/screens/homepage_screen.dart";
import "package:final_task_kquotes/screens/profile_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black54,
      child: ListView(
        children: [
          //header
          Container(
            padding: const EdgeInsets.only(
              top: 26,
              bottom: 12,
            ),
            child: Column(
              children: [
                Text(
                  "name",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12)
              ],
            ),
          ), //body
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
                const Divider(height: 10, thickness: 2, color: Colors.grey),

                //Home
                ListTile(
                    leading: const Icon(Icons.home, color: Colors.grey),
                    title: const Text("Home",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    onTap: () {
                      Get.back();
                    }),

                //Not Yet Received
                const Divider(height: 10, thickness: 2, color: Colors.grey),
                ListTile(
                    leading: const Icon(Icons.picture_in_picture_alt_rounded,
                        color: Colors.grey),
                    title: const Text("My Profile",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    onTap: () {
                      Get.to(UserProfile());
                    }),

                //LogOut
                const Divider(height: 10, thickness: 2, color: Colors.grey),
                ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.grey),
                    title: const Text("LogOut",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    onTap: () {
                      /*   //   FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(
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
