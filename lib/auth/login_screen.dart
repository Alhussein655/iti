import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:iti/auth/forget_screen.dart';
import 'package:iti/modules/home_screen.dart';
import 'package:iti/auth/register_screen.dart';
import 'package:iti/widget/my_button.dart';
import 'package:iti/widget/my_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
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
                    child: Text('Log In Now',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please login to continue using our App',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
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
                      name: 'email',
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
                      name: 'password',
                      pref: Icon(Icons.lock_outline)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen(),));
                          },
                          child: Text(
                            'forget password?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await auth
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              )).catchError((err) {
                            print(err.toString());
                          });
                        }).catchError((err) {
                          print('error:${err.toString()}');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 3),
                              content: Text(err.toString())));

                        });
                      } else {
                        print('error');
                      }
                    },
                    child: MyButton(
                      name: 'Login',
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
                        Text(
                          'don\'t have an account?',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          child: MyButton(
                            fsize: 15,
                            textcolor: Colors.pink,
                            backcolor: Colors.white,
                            border: 5,
                            name: 'Register now',
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
