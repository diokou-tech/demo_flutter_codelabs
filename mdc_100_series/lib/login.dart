import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void cancelLogin() {
    usernameController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo_Diokou.png',
                  width: 200,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Diokou Tech',
                  style: TextStyle(color: Colors.redAccent),
                ),
                //text Name
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      iconColor: Colors.redAccent,
                      filled: true),
                ),
                //password
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password", filled: true),
                ),
                OverflowBar(
                  children: [
                    TextButton(onPressed: cancelLogin, child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Login"))
                  ],
                )
              ],
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}
