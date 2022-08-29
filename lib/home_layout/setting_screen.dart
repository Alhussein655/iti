import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti/auth/login_screen.dart';
import 'package:iti/modules/aboutApp.dart';
import 'package:iti/widget/setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70,),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1506901437675-cde80ff9c746?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGV2ZXJ5dGhpbmd8ZW58MHx8MHx8&w=1000&q=80'),
          ),
          SizedBox(height: 15,),

          Text('Mera Amir',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 100,),
          SettWid(
            onTap: (){},
          name: 'My Profile',
          icon: Icons.person,
          ),
          SettWid(
            onTap: (){},
            name: 'Messeges',
            icon: Icons.message,
          ),   SettWid(
            onTap: (){},
            name: 'Notifications',
            icon: Icons.notifications,
          ), SettWid(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Lay3(),));
            },
            name: 'About',
            icon: Icons.info_outline,
          ),   SettWid(
            onTap: () async {
            await  FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

            },
            name: 'Log out',
            icon: Icons.logout,
          ),],
      )),
    );
  }
}
