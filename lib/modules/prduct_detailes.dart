import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iti/widget/my_button.dart';

class ProductDetailesScreen extends StatefulWidget {
  ProductDetailesScreen({this.price,this.img,this.name});
String? price,img,name;

  @override
  State<ProductDetailesScreen> createState() => _ProductDetailesScreenState();
}

class _ProductDetailesScreenState extends State<ProductDetailesScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                child: Image.network(
                    fit: BoxFit.fill,
                    widget.img!
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     widget.name!,
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Text(
                      widget.price!,
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              RatingBar.builder(
                itemSize: 25,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.pink,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  softWrap: true,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  'This product are comfort and verry niceThis pants are comfort and verry niceThis pants are comfort and verry niceThis pants are comfort and verry nice',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Size',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text(
                      'S',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Text(
                      'M',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Text(
                      'L',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.pink),
                    ),
                    Text(
                      'XL',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Quantity',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          quantity--;
                        });
                      },
                      icon: Icon(Icons.remove)),
                  Text(
                    quantity.toString(),
                    style: TextStyle(color: Colors.pink),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(Icons.add)),
                ],
              ),
              Center(
                child: MyButton(
                  name: 'Buy now',
                  backcolor: Colors.pink,
                  textcolor: Colors.white,
                  h: 40,
                  w: 150,
                  fsize: 18,
                  border: 20,
                ),
              )
            ],
          ),
          Positioned(
            top: 10,
              left: 10,
              child: IconButton(

                  onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,))),
          ]
        ),
      )),
    );
  }
}
