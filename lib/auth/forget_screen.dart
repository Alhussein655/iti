import 'package:flutter/material.dart';
import 'package:iti/widget/my_button.dart';
import 'package:iti/widget/my_form_field.dart';

class ForgetScreen extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
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
           child: Text('Forget password',
               style: TextStyle(
                   fontSize: 25, fontWeight: FontWeight.w700)),
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
             controller: phoneController,
             inputType: TextInputType.phone,
             validate: (v) {
               if (v!.isEmpty) {
                 return 'required';
               } else
                 return null;
             },
             isSecured: false,
             label: 'phone',
             pref: Icon(Icons.phone)),
         MyButton(
           name: 'Continue',
           border: 10,
           backcolor: Colors.pink,
           textcolor: Colors.white,
           h: 50,
           w: double.infinity,
           fsize: 20,
         ),
       ],
     ),
        ),
      ),
    );
  }
}
