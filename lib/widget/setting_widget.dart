import 'package:flutter/material.dart';

class SettWid extends StatelessWidget {
  SettWid({this.icon,this.name,this.onTap});
IconData? icon;
String? name;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 120),
        child:
        InkWell(
            onTap:onTap,
            child:   Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [

               Icon(icon,color: Colors.pink,size: 30,),
            SizedBox(width: 30,),
            Text(name!,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        ),)
      );
  }
}
