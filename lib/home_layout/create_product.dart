import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iti/home_layout/home1.dart';
import 'package:iti/product/product_mode.dart';
import 'package:iti/widget/my_button.dart';

class CreateProduct extends StatefulWidget {
  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
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

              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'required';
                    } else
                      return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text('name'), border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'required';
                    } else
                      return null;
                  },
                  controller: priceController,
                  decoration: InputDecoration(
                      label: Text('price'), border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'required';
                    } else
                      return null;
                  },
                  controller: imgController,
                  decoration: InputDecoration(
                      label: Text('imgurl'), border: OutlineInputBorder()),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final String name = nameController.text;
                      final String price = priceController.text;
                      final String image= imgController.text;
                      final docUser =
                          FirebaseFirestore.instance.collection("products").doc();
                      final product = ProductModel(name: name, price: price,id: docUser.id,img: image);
                      final json = product.toMap();
                      await docUser.set(json).catchError((e){print(e.toString());});
                      nameController.text = '';
                      priceController.text = '';
                      imgController.text = '';
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Lay1(),));
                    }
                  },
                  child: MyButton(
                    name: 'add product',
                    border: 15,
                    backcolor: Colors.pink,
                    textcolor: Colors.white,
                    h: 50,
                    w: double.infinity,
                    fsize: 20,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
