import 'package:flutter/material.dart';

class Lay3 extends StatelessWidget {
  const Lay3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                    Row(

                      children: [
                        IconButton(
                            onPressed:(){Navigator.pop(context);},
                            icon: Icon(Icons.arrow_back_ios))],),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  
                  Text(
                    textAlign: TextAlign.center,
                    'About App:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        'this app uses for adding products to firebase and and get them from there',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    'About Team:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Team.name('Alhussein Ahmed Abdelrazek Alsheikh'),
                  Team.name('manar mohamed abo swilam'),
                  Team.name('omnia mahmoud altokhy'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Team extends StatelessWidget {
  String? name;

  Team.name(this.name);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name!,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
