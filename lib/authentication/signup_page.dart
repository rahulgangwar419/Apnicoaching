
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  final _key = GlobalKey<FormState>();

  String? _validfirstname(String value) {
    if (value.isEmpty || value == null) {
      return 'First name should not be null';
    } else {
      return null;
    }
  }

  String? _validemail(String? value) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
              key: _key,
              child: Column(
               
                children: [
                  Image.network(
                      'https://w7.pngwing.com/pngs/870/93/png-transparent-sign-up-illustration-button-computer-icons-red-sign-up-now-button-image-file-formats-text-presentation-thumbnail.png',height: 100,width: MediaQuery.of(context).size.width,),
                 
                 SizedBox(height: 20,), Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter First Name',
                          labelText: 'First Name'),
                      key: const ValueKey('firstname'),
                      validator: (value) {
                        _validfirstname;
                      },
                      onSaved: (value) {
                        firstname = value.toString();
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TextFormField(
                      key: ValueKey('lastname'),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Last Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        lastname = value.toString();
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TextFormField(
                      key: ValueKey('email'),
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          )),
                      validator: _validemail,
                      onSaved: (value) {
                        email = value.toString();
                      },
                    ),
                  ),
                 SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TextFormField(
                      key: ValueKey('password'),
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
                      validator: (value) {
                        _validPassword;
                      },
                      onSaved: (value) {
                        password = value.toString();
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  
                ],
              )),
        ),
      ),
    );
  }
}
