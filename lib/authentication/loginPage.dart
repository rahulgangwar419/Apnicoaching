import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onlineteaching/authentication/homePage.dart';
import 'package:onlineteaching/authentication/signup_page.dart';
import 'package:onlineteaching/authentication/splashPage.dart';
import 'package:onlineteaching/screen/homescreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = '';
  String email = '';
  String password = '';
  final _key = GlobalKey<FormState>();
  static const String KEYLOGIN = 'login';

  String? _validUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter e-mail';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please Enter a vaild e-mail';
    } else {
      return null;
    }
  }

  String? _validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter password';
    }
    if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$')
        .hasMatch(value)) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  double get radius => 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/loginimage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          )),
                      key: ValueKey('email'),
                      validator: _validUserName,
                      onSaved: (value) {
                        email = value.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            gapPadding: 5,
                          ),
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.password,
                            color: Colors.grey,
                          )),
                      key: ValueKey('password'),
                      validator: _validPassword,
                      onSaved: (value) {
                        password = value.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Color.fromARGB(255, 197, 18, 108),
                          ),
                        ),
                        onPressed: () async {
                          var sharedPref =
                              await SharedPreferences.getInstance();
                          sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            var sharedPref =
                                await SharedPreferences.getInstance();
                            sharedPref.setBool(
                                SplashScreenState.KEYLOGIN, true);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                            print('Username: $email, Password: $password');
                          }
                        }),
                  ),
                  // -------Signup------

                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          icon: Icon(Icons.login),
                          label: Text('SignUp'))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
