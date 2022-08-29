import 'package:flutter/material.dart';
import 'package:iti/home_layout/home1.dart';
import 'package:iti/home_layout/setting_screen.dart';
import 'package:iti/home_layout/create_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>screens=[Lay1(),CreateProduct(),SettingScreen()];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.pink),
          onTap: (v){
            setState(() {
              currentIndex=v;
            });
          },
          currentIndex: currentIndex,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
      ]),
      body: Center(child: screens[currentIndex],),
    );
  }
}
