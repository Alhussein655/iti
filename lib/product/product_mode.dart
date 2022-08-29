class ProductModel {
  String? id, name, price,img;
  ProductModel({this.price, this.name,this.id,this.img});
 Map<String,dynamic> toMap() {
    return {'id':id,'name': name, 'price': price,'img':img};
  }

  ProductModel.fromMap(Map<String, dynamic> json) {
    name = json[name];
    price = json[price];
    id=json[id];
    img=json[img];
  }
}
