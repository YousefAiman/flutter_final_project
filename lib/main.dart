import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Login.dart';
void main() => runApp(MyApp());

class Main extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainState();
  }
}
class MainState extends State<Main>{
  List itemList = [
    'Card Text 2 Line 1',

  ];
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          key: formKey,
          body: Builder(builder: (context){
            return Column(
                children: <Widget>[
                 Container(height: 80,
                margin: EdgeInsets.only(left:30,top:30,right:30,bottom:10),
                child: SearchBar()
            ),
            Expanded(
            child: SingleChildScrollView(
                   scrollDirection: Axis.vertical,
                      child: Column(
                          mainAxisSize: MainAxisSize.min
                          ,children: <Widget>[
                        Container(
                          child: Text('Categories', style: TextStyle(fontSize: 25,)),
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          margin: EdgeInsets.only(top:15),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  color: Colors.blue,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 100,
                                    child: Text('Woman', style: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  color: Colors.pink,
                                  elevation: 10,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 100,
                                    child: Text('Man', style: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                              Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  elevation: 10,
                                  color: Colors.greenAccent,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 100,
//                          child:  Image.asset('images/image1.jpg'),
                                    child: Text('Kids', style: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Text('Featured', style: TextStyle(fontSize: 25,)),
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        ),
                        Flexible(
                          child: GridView.count(
                              childAspectRatio: 2/3,
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(10,(index){
                                return Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 230,
                                        child:
                                        Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            margin: EdgeInsets.all(10),
                                            semanticContainer: true,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            child:GestureDetector(
                                                onTap: ()=>{
                                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                                      'Value}'
                                                  )))}
                                                ,child: Container(
                                                child: Image(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage('images/cover.jpg'))))
                                        )
                                      )
                                      ,Container(
                                        child: Text('Featured', style: TextStyle(fontSize: 19,)),
                                        alignment: Alignment.bottomLeft,
                                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      ),Container(
                                        child: Text('Featured', style: TextStyle(fontSize: 19,)),
                                        alignment: Alignment.bottomLeft,
                                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      )

                                    ],

                                  ),
                                );
                              })
                          ),
                        ),
                      ])))
                ]
          );
        }),
        )
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
