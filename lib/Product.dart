import './database_control.dart';
class Product{
  int Id;
  String name;
  String price;
  String category;
  String desc;
  String image;

  Product({
   this.Id,
    this.name,this.price,this.category,this.desc,this.image});


  Product.fromMap(Map<String,dynamic> data){
    category = data['category'];
    desc = data['description'];
    name = data['name'];
    price = data['price'];

  }
  factory Product.fromJson(Map<String,dynamic> json)=>Product(
      Id: json[DbHelper.usersColumnIdName],
      name: json[DbHelper.productsColumnName],
      price: json[DbHelper.productsColumnPriceName],
      category: json[DbHelper.productsColumnCategoryName],
      desc: json[DbHelper.productsColumnDescName]
  );

  Map<String,dynamic> toMap(){
    return {
      DbHelper.productsColumnName: name,
      DbHelper.productsColumnPriceName: price,
      DbHelper.productsColumnCategoryName: category,
      DbHelper.productsColumnDescName: desc
    };
  }

}