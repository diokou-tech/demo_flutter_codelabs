import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void cancelLogin() {
    messageError = "";
    usernameController.clear();
    passwordController.clear();
  }

  String messageError = "";

  void login(String username, String password) {
    if (username.isEmpty && password.isEmpty) {
      messageError = "Veuiller remplir tous les champs !";
      _logger.e(messageError);
    } else if (username != "zola" && password != "passer") {
      messageError = "Identifiants incorrects !";
      _logger.e(messageError);
    } else {
      Navigator.pushNamed(context, "/");
    }
  }

  final _logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFEEAE6),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/diamond.png',
                ),
                Text(
                  "SHRINE",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16.0),
                messageError.isNotEmpty
                    ? Text(
                        messageError,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      )
                    : Text(messageError),
                const SizedBox(height: 16.0),
                //text Name
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    iconColor: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 20),
                //password
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 20),
                OverflowBar(
                  spacing: 10.0,
                  children: [
                    TextButton(
                        onPressed: () {
                          cancelLogin();
                          _logger.d("cancel !");
                        },
                        style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)))),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            var username = usernameController.text;
                            var password = passwordController.text;
                            login(username, password);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 8.0,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            )),
                        child: Text("Login")),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                    onPressed: null,
                    child: Text(
                      "Mot de passe oublié !",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))
              ],
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}
