import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CreateAddress.dart';
import 'ProductDetails.dart';

void main() => runApp(Cart());

class Cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartState();
  }

}

class CartState extends State<Cart>{
  // ignore: non_constant_identifier_names
  var product_on_the_cart = [
    {
      "name":"Ahmed",
      "image":"images/image1.jpg",
      "price": 34.00,
      "size":"M",
      "color":"Red",
      "quantity":1
    },
    {
      "name":"Mohammad",
      "image":"images/image2.jpg",
      "price": 49.00,
      "size":"XL",
      "color":"Black",
      "quantity":1
    },
    {
      "name":"Ahmed",
      "image":"images/image1.jpg",
      "price": 34.00,
      "size":"M",
      "color":"Red",
      "quantity":1
    },
    {
      "name":"Mohammad",
      "image":"images/image2.jpg",
      "price": 49.00,
      "size":"XL",
      "color":"Black",
      "quantity":1
    },
    {
      "name":"Ahmed",
      "image":"images/image1.jpg",
      "price": 34.00,
      "size":"M",
      "color":"Red",
      "quantity":1
    },
    {
      "name":"Mohammad",
      "image":"images/image2.jpg",
      "price": 49.00,
      "size":"XL",
      "color":"Black",
      "quantity":1
    },
    {
      "name":"Ahmed",
      "image":"images/image1.jpg",
      "price": 34.00,
      "size":"M",
      "color":"Red",
      "quantity":1
    },
    {
      "name":"Mohammad",
      "image":"images/image2.jpg",
      "price": 49.00,
      "size":"XL",
      "color":"Black",
      "quantity":1
    }
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: (''),
      home: Scaffold(
        appBar: AppBar(
            title: Text('Cart'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetails();
              }));
            },
          ),

        ),
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.only(top: 50),
          child: RaisedButton(
            child: Text('Continue', style: TextStyle(color: Colors.white)),
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CreateAddress();
              }));

            },
            color: Colors.blue,

            padding: const EdgeInsets.symmetric(
              horizontal: 140,
              vertical: 18,
            ),
          ),
        ),
          body: Builder(builder: (context){
            return ListView.builder(
                itemCount: product_on_the_cart.length,
                itemBuilder: (context, index){
               return single_cart(
                 prod_name: product_on_the_cart[index]['name'],
                 prod_image: product_on_the_cart[index]['image'],
                 prod_price: product_on_the_cart[index]['price'],
                 prod_size: product_on_the_cart[index]['size'],
                 prod_color: product_on_the_cart[index]['color'],
                 prod_quan: product_on_the_cart[index]['quantity'],
               );
            });
            
           /* return Card(
              child: ListTile(
                leading:  Image.asset('images/image1.jpg'),

                title: new Text('Man t-shirt'),
                subtitle: new Row(children: <Widget>[
                  new Column(children: <Widget>[

                    Container(
                      child: new Text('Lotto.LTD',),
                      padding: const EdgeInsets.symmetric(vertical: 10),

                    ),
                    Container(
                      child: new Text('\$ 34.00', style: TextStyle(fontSize: 17 ,color: Colors.blue, fontWeight: FontWeight.bold),),
                      padding: const EdgeInsets.symmetric(vertical: 3),
                    ),



                  ],),


                ],),

                trailing: new Column(children: <Widget>[

                  new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
                  new Text('1'),
                  new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
                ],),

            ),
            );*/
/*                    Padding(
                      child: new Text('Lotto.LTD',),
                      padding: const EdgeInsets.all(10),
                    ),

                    Padding(
                      child: new Text('\$ 34.00'),
                      padding: const EdgeInsets.all(10),
                    ),*/
            /*return ListView(
             children: <Widget>[
               Container(

                 child: new Card(
                   child: Row(children: <Widget>[
                     Container(
                       child: Image.asset('images/image1.jpg', width: 100, height: 100,),
                       padding: const EdgeInsets.symmetric(horizontal: 30),
                     ),


                     Container(
                         padding: const EdgeInsets.symmetric(vertical: 5),
                         child: Column(children: <Widget>[
                           Container(
                             child: new Text('Man t-shirt'),
                           ),
                           Container(
                             child: new Text('Lotto.LTD'),
                           ),
                           Container(
                             child: new Text('\$ 34.00', style: TextStyle(fontSize: 17 ,color: Colors.blue, fontWeight: FontWeight.bold),),
                           )
                       ],)
                     ),
                     Container(
                       child: new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
                     ),
                     Container(
                       child:  new Text('1'),
                     ),
                     Container(
                       child: new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
                     ),



                   ],)

                 ),
               )
             ],
           );*/
            
          }),
      )
    );
  }

}

// ignore: camel_case_types
class single_cart extends StatelessWidget{
  final prod_name;
  final prod_image;
  final prod_price;
  final prod_size;
  final prod_color;
  final prod_quan;
  single_cart({
    this.prod_name,
    this.prod_image,
    this.prod_price,
    this.prod_size,
    this.prod_color,
    this.prod_quan,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading:  Image.asset('images/image1.jpg', width: 80, height: 80,),

        title: new Text(prod_name),
        subtitle: new Column(children: <Widget>[
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
                child: new Text('Size:')
            ),
            Padding(
                padding: const EdgeInsets.all(4),
                child: new Text(prod_size, style: TextStyle(color: Colors.red),)
            ),

            Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: new Text('Color:')
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: new Text(prod_color,  style: TextStyle(color: Colors.red),)
            ),
          ],),

          new Container(
            alignment: Alignment.topLeft,
            child: new Text('\$${prod_price}', style: TextStyle(color: Colors.blue, fontSize: 17 ,fontWeight: FontWeight.bold),)
          )

        ],),

        trailing: new Column(children: <Widget>[
          new IconButton(icon: Icon(Icons.arrow_drop_up),
              onPressed: (){}),
          new Text('1'),
          new IconButton(icon: Icon(Icons.arrow_drop_down),
              padding: EdgeInsets.symmetric(vertical: 15),
              onPressed: (){}),
        ],),
      ),



    );


  }

}