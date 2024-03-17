import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlineteaching/authentication/loginPage.dart';
import 'package:onlineteaching/screen/homescreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/icons/splashlogo.png')),
          const Text(
            'Easy Learning',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLogin = sharedPref.getBool(KEYLOGIN);

     Timer(const Duration(seconds: 2), () {
      if(isLogin!=null){
        if(isLogin){
           Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
        else{
           Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }

      }
      else{
           Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
     
    });

  }
}
