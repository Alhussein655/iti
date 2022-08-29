import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iti/modules/prduct_detailes.dart';
import 'package:iti/product/api.dart';
import 'package:iti/product/product_mode.dart';

class Lay1 extends StatefulWidget {
  @override
  State<Lay1> createState() => _Lay1State();
}

class _Lay1State extends State<Lay1> {
/*List<ProductModel> product=[ProductModel(
  id: '1',price: '20',name: 'aa'
),ProductModel(
    id: '1',price: '20',name: 'aa'
),ProductModel(
    id: '1',price: '20',name: 'aa'
)];

getProduct() async {
 product=await Api().getProduct();
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }*/
  final Stream<QuerySnapshot> products =
      FirebaseFirestore.instance.collection('products').snapshots();
  ScrollController scrollController = ScrollController();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.line_weight_sharp,
                            color: Colors.pink,
                            size: 30,
                          )),
                      Text(
                        'Fashion',
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.pink,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.pink,
                            size: 30,
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: products,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  final data = snapshot.requireData;
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: data.size,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 9, crossAxisCount: 2),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          current = index;
                          print(current);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailesScreen(
                                    img: data.docs[current]['img'],
                                    name: data.docs[current]['name'],
                                    price: data.docs[current]['price']),
                              ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 140,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Image.network(data.docs[index]['img'],
                                      fit: BoxFit.fill),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      radius: 15,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  data.docs[index]['name'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  data.docs[index]['price'],
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
