import 'package:flutterfinalproject/Cart.dart';
import 'package:flutter/material.dart';

void main() => runApp(ProductDetails());

class ProductDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetailsState();
  }

}


class ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Product Description'),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {

                }));
              },
            ),

          ),

          bottomNavigationBar:
          Container(
            padding: EdgeInsets.only(top: 50),
            child: RaisedButton(
              child: Text('BUY NOW', style: TextStyle(color: Colors.white)),
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Cart();
                  }));
                });
              },
              color: Colors.blue,

              padding: const EdgeInsets.symmetric(
                horizontal: 140,
                vertical: 18,
              ),
            ),
          ),
          backgroundColor: const Color(0xffffffff),
          body: Builder(builder: (context){
            return Column(children: <Widget>[
              Container(
                height: 200,
                child: new ListView(
                  children: <Widget>[

                  ],
                ),
              ),

              Container(
                child: Text('Muslim form', style: TextStyle(fontSize: 25,)),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              ),

              Container(
                child: Text('\$ 42', style: TextStyle(fontSize: 20, color: Colors.blue)),
                alignment: Alignment.topLeft,

                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              Container(
                child: Text('Description', style: TextStyle(fontSize: 20,)),
                padding: EdgeInsets.only(top: 50),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              Container(
                child: Text('jsju iuwqo dsaiu r oqhw udsioahiodhsa dhs dsaiuhdoah isidjsaor8sdha sohatp8qewis ha dsadsald; dsdlksoajrwoqrps dsojqp dosajprj sadojkproqwjk djsapod', style: TextStyle(fontSize: 20,)),
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),




              ],);
/*            return Scaffold(
              body: Column(children: <Widget>[
                Container(
                  height: 250,
                  child: new ListView(children: <Widget>[
                    imageCarousel
                  ],),
                ),

                Container(
                  child: Text('Muslim form', style: TextStyle(fontSize: 25,)),
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ],

              ),


            );*/
          }),
        ));
  }

//  Widget imageCarousel = new Container(
//    height: 200,
//    child: new Carousel(
//      boxFit: BoxFit.cover,
//      images: [
//        Image.asset('images/image1.jpg'),
//        Image.asset('images/image2.jpg'),
//        Image.asset('images/image3.png'),
//        Image.asset('images/facebook.png'),
//        Image.asset('images/twitter.png')
//      ],
//      autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(microseconds: 1000),
//      dotSize: 5,
//      indicatorBgPadding: 5,
//
//    ),
//  );



}



