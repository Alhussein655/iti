import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:iti/auth/login_screen.dart';
import 'package:iti/widget/my_button.dart';
import 'package:iti/widget/my_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          border: Border.all(
                              color: Colors.pinkAccent,
                              width: 5,
                              style: BorderStyle.solid)),
                      child: Center(
                          child: Text(
                        'R',
                        style:
                            TextStyle(color: Colors.pinkAccent, fontSize: 50),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sign Up Now',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Please fill the details and create your Account',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
                  MyFormField(
                      controller: nameController,
                      inputType: TextInputType.text,
                      validate: (v) {
                        if (v!.isEmpty) {
                          return 'required';
                        } else
                          return null;
                      },
                      isSecured: false,
                      label: 'name',
                      pref: Icon(Icons.person)),
                  MyFormField(
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      validate: (v) {
                        if (v!.isEmpty) {
                          return 'required';
                        } else
                          return null;
                      },
                      isSecured: false,
                      label: 'email',
                      pref: Icon(Icons.email_outlined)),
                  MyFormField(
                      controller: passwordController,
                      inputType: TextInputType.visiblePassword,
                      validate: (v) {
                        if (v!.isEmpty) {
                          return 'required';
                        } else
                          return null;
                      },
                      isSecured: isVisible,
                      suff: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      label: 'password',
                      pref: Icon(Icons.lock_outline)),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                      formKey.currentState!.validate();
                      print(emailController.toString());
                      print(passwordController.toString());
                      var auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: MyButton(
                      name: 'Register',
                      border: 10,
                      backcolor: Colors.pink,
                      textcolor: Colors.white,
                      h: 50,
                      w: double.infinity,
                      fsize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('already have an account?'),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: MyButton(
                            fsize: 15,
                            textcolor: Colors.pink,
                            backcolor: Colors.white,
                            border: 5,
                            name: 'sign in',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Or'),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          Buttons.Apple,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.GitHub,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.LinkedIn,
                          mini: true,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
