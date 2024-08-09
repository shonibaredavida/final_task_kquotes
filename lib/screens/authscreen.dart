import 'package:final_task_kquotes/screens/login_tab_page.dart';
import 'package:final_task_kquotes/screens/signup_tab.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
              indicatorColor: Colors.white54,
              indicatorWeight: 8,
              tabs: [
                Tab(
                  text: "Login",
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  text: "SignUp",
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ]),
        ),
        body: const TabBarView(children: [
          LoginTabPage(),
          SignupTaPage(),
        ]),
      ),
    );
  }
}
