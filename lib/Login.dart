import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Customer.dart';
import 'Product.dart';
import 'database_control.dart';

void main() => {
runApp(MaterialApp(title: 'Named Routes Demo', initialRoute: '/signup', routes: {
'/signup': (context) => Signup()
,'/login': (context) => MyApp()
}))};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final myController1 = new TextEditingController();


  bool state =false;
  String email,password;
  setEmail(String value){
    this.email= value;
  }
  setPassword(String value){
    this.password = value;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  saveMyForm(){
    if(!formKey.currentState.validate()){
      return ;
    }

//    Navigator.push(context,
//        MaterialPageRoute(
//            builder: (context) => Main()
//        )
//    );
    formKey.currentState.save();
    DbHelper.dbHelper.database;
    email = email.replaceAll("@","");
    DbHelper.dbHelper.retrieveUserData(email,password).then((onValue){
      if(onValue){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => Main()
            )
        );
      }else{
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(
            'Either your email or password are incorrect'
        )));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context)
    {return Form(
          key: formKey,
          child: Transform.translate(
              offset: Offset(15.0, 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 33,
                            color: const Color(0xff000000),
                            height: 1.55,
                          ),
                          textAlign: TextAlign.left,
                        )),
                    new Container(
                        margin: EdgeInsets.only(top: 35),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(border: Border(
                            bottom: BorderSide(color: Colors.black))),
                        height: 30,
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return "Email is required";
                            }
                          },onSaved: (newValue){
                          setEmail(newValue);
                        },
                        )),
                    new Container(
                        margin: EdgeInsets.only(top: 35),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(border: Border(
                            bottom: BorderSide(color: Colors.black))),
                        height: 30,
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return "Password is required";
                            }
                          },onSaved: (newValue){
                          setPassword(newValue);
                        },
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 40),
                        width: 385.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.0, 0.0),
                            end: Alignment(-1.0, 0.0),
                            colors: [
                              const Color(0xff58a1ff),
                              const Color(0xff6b7fff)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000e44),
                              offset: Offset(0, 8),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: FlatButton(
                            onPressed: () {
                              saveMyForm();
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            )))
                    ,

        GestureDetector(
            onTap:(){
        saveMyForm();
//              Navigator.push(context,
//                  MaterialPageRoute(
//                      builder: (context) => Signup()
//                  )
//              );

//            Navigator.pushNamed(context,'/signup',arguments:<String,String> {'title': "fdssdf"});
            },
            child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              color: const Color(0x73000000),
                              height: 1.75,
                            ),
                            textAlign: TextAlign.left,
                          )
                      ),
                      Container(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color(0x73000000),
                              height: 1.75,
                            ),
                            textAlign: TextAlign.left,
                          )
                      )

                    ]
                )
            )
        )

                  ])
          ));
    });
  }
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}
class SignupFormState extends State<SignupForm> {
  String name,email,password,type;
  setName(String value){
    this.name= value;
  }
  setEmail(String value){
    this.email= value;
  }
  setPassword(String value){
    this.password = value;
  }
  //setType(String value){
  // this.type= value;
  //}
  bool state =false;
  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //RegExp regExp = new RegExp(p);
  RegExp regExp = new RegExp(p);
  final myController1 = new TextEditingController();
  String dropdownValue = 'Merchant';

  List <String> spinnerItems = [
    'Merchant',
    'Customer',
  ];

  GlobalKey<FormState> formKey = GlobalKey();
  saveMyForm()  {
    if(!formKey.currentState.validate()){
      return;
    }
    formKey.currentState.save();
    DbHelper.dbHelper.database;
    email = email.replaceAll("@","");
    Customer customer =  Customer.fromJson({
      DbHelper.usersColumnUserName:name,
      DbHelper.usersColumnPasswordName:password,
      DbHelper.usersColumnEmailName:email,
      DbHelper.usersColumnTypeName:dropdownValue,
    });
    DbHelper.dbHelper.insertNewUserRaw(customer);
  }
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      return Form(
          key: formKey,
          child: Transform.translate(
              offset: Offset(20.0, 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(top:20),
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 33,
                            color: const Color(0xff000000),
                            height: 1.55,
                          ),
                          textAlign: TextAlign.left,
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right:30),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        height: 25,
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return "Name is required";
                            }
                          },onSaved: (newValue){
                          setName(newValue);
                        },
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right:30),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        height: 25,
                        child: TextFormField(
                            validator: (value){
                              if(value.isEmpty){
                                return "Email is required";
                              }else if(!regExp.hasMatch(value)){
                                return "Incorrect Email Syntax";
                              }
                            },onSaved: (newValue){
                          setEmail(newValue);
                        }
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right:30),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        height: 25,
                        child: TextFormField(
                            validator: (value){
                              if(value.isEmpty){
                                return "Password is required";
                              }else if(value.length < 6){
                                return "Password length most be more then 6";
                              }
                            },onSaved: (newValue){
                          setState(() {
                            this.password= newValue;
                          });
//                          setPassword(newValue);
                        }
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Type',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    new Container(
                        width: 375,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: const Color(0x73000000), fontSize: 18),
                          underline: Container(
                            height: 2,
                            color:  const Color(0x73000000),
                          ),
                          onChanged: (String data) {
                            setState(() {
                              dropdownValue = data;
                            });
                          },
                          items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    Container(
                        margin: EdgeInsets.only(top:20),
                        width: 385.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.0, 0.0),
                            end: Alignment(-1.0, 0.0),
                            colors: [
                              const Color(0xff58a1ff),
                              const Color(0xff6b7fff)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000e44),
                              offset: Offset(0, 8),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: FlatButton(
                            onPressed: () {
                              saveMyForm();
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                                  'Account Created!'
                              )));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            )))
                    ,
                    new Container(
                        margin: EdgeInsets.only(top:10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Container(
                                  child: Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      color: const Color(0x73000000),
                                      height: 1.75,
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                              ),GestureDetector(
                                  onTap: (){
//                                    Navigator.push(context,
////                                        MaterialPageRoute(
////                                            builder: (context) => MyApp()
////                                        )
////                                    );
//                                   Navigator.pushNamed(context,'/login',arguments:<String,String> {'title': "fdssdf"}
//                                    );
                                  },
                                  child:
                                  Container(
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: const Color(0x73000000),
                                          height: 1.75,
                                        ),
                                        textAlign: TextAlign.left,
                                      )
                                  )
                              )

                            ]
                        )
                    )
                  ])
          ));
    });


  }
}
List<Product> products = new List();

class Main extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return MainState();
  }
}
class MainState extends State<Main>{
//  getData() async {
//
//    await productsCollection.getDocuments().then((QuerySnapshot querySnapshot){
////      for(int i=0;i<querySnapshot.documents.length;i++){
////        querySnapshot.documents.elementAt(i);
////      }
//      querySnapshot.documents.forEach((document) {
//        Product product = Product.fromMap(document.data);
//        products.add(product);
//      });
////   for(int i=0;i<querySnapshot.documents.length;i++){
////     DocumentSnapshot ds = querySnapshot.documents.elementAt(i);
////     Product product = new Product();
////     product.name =ds.data.toString();
////
////   }
////      products =  querySnapshot.documents.cast<Product>();
//    });
////        .snapshots().forEach((element) {
////      Product product = new Product();
////      product.desc = element.documents.removeAt(0).
////    });
//
////    await DbHelper.dbHelper.database;
////    await  DbHelper.dbHelper.retrieveAllProducts().then((onValue){
////       products =onValue;
////    });
//  }

//  @override
//  void initState(){
//    getData();
//    super.initState();
//  }
  List itemList = [
    'Card Text 2 Line 1',
  ];
  CollectionReference productsCollection  = Firestore.instance.collection("products");
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  initState() {
    super.initState();

    new Future<String>.delayed(new Duration(seconds: 2), () => '["123", "456", "789"]').then((String value) {
      setState(() async {
       await productsCollection.getDocuments().then((QuerySnapshot querySnapshot){
          querySnapshot.documents.forEach((document) {
            Product product = Product.fromMap(document.data);
            products.add(product);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    WidgetsBinding.instance
//        .addPostFrameCallback((_) =>
//
//    );
    return MaterialApp(
        home: Scaffold(
          key: formKey,
          bottomNavigationBar:
            Container(
              child:RaisedButton(
                  color: Colors.blue,
                  child: Text('Add Product', style: TextStyle(color: Colors.white)),
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
    return AddProduct();
    }));
    }
              )
            ),
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
                                        child: Text('Woman', style: TextStyle(fontSize: 15,color: Colors.white)),
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
                                        child: Text('Man', style: TextStyle(fontSize: 15,color: Colors.white)),
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
                                        child: Text('Kids', style: TextStyle(fontSize: 15,color: Colors.white)),
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
                                  children: List.generate(products.length,(index){
                                    return Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                              height: 200,
                                              child:
                                              Card(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                  margin: EdgeInsets.all(10),
                                                  semanticContainer: true,
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  child:GestureDetector(
                                                      onTap: ()=>{
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                       return ProductDetails(products.elementAt(index));
                                                      }))}
                                                      ,child: Container(
                                                      child: Image(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage('images/cover.jpg'))))
                                              )
                                          )
                                          ,Container(
                                            child: Text('\$'+products.elementAt(index).price, style: TextStyle(fontSize: 19,)),
                                            alignment: Alignment.bottomLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                          ),Container(
                                            child: Text(products.elementAt(index).category+" "+products.elementAt(index).name, style: TextStyle(fontSize: 19,)),
                                            alignment: Alignment.bottomLeft,
                                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                              ),
                            ),
                          ]))),
                ]
            );
          }),
        )
    );
  }

//  Widget _buildCarousel(BuildContext context, int carouselIndex) {
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Text('Carousel $carouselIndex'),
//        SizedBox(
//          // you may want to use an aspect ratio here for tablet support
//          height: 200.0,
//          child: PageView.builder(
//            // store this controller in a State to save the carousel scroll position
//            controller: PageController(viewportFraction: 0.8),
//            itemBuilder: (BuildContext context, int itemIndex) {
//              return _buildCarouselItem(context, carouselIndex, itemIndex);
//            },
//          ),
//        )
//      ],
//    );
//  }
//
//  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
//    return Padding(
//      padding: EdgeInsets.symmetric(horizontal: 4.0),
//      child: Container(
//        decoration: BoxDecoration(
//          color: Colors.grey,
//          borderRadius: BorderRadius.all(Radius.circular(4.0)),
//        ),
//      ),
//    );
//  }
}

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: AddOrderForm(),
      ),
    );
  }
}

class AddOrderForm extends StatefulWidget {
  @override
  AddOrderFormState createState() {
    return AddOrderFormState();
  }
}
class AddOrderFormState extends State<AddOrderForm> {

  CollectionReference productsCollection  = Firestore.instance.collection("products");
  String name,price,category,description;

  setName(String value){
    this.name= value;
  }
  setPrice(String value){
    this.price= value;
  }
  setCategory(String value){
    this.category = value;
  }
  setDescription(String value){
    this.description = value;
  }
  bool state =false;
  final myController1 = new TextEditingController();
  String dropdownValue = 'Woman';
  List <String> spinnerItems = [
    'Woman',
    'Man',
    'Kids'
  ];
  GlobalKey<FormState> formKey = GlobalKey();
  saveMyForm() async {
    if(!formKey.currentState.validate()){
      return;
    }
    formKey.currentState.save();

   await productsCollection.add({
      'name':name,
      'price':price,
      'category':dropdownValue,
      'description':description
    });

    Navigator.pop(this.context);

    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Main()
        )
    );
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return ProductDetails(products.elementAt(index));
//    }));
//    DbHelper.dbHelper.database;
//    Product product =  Product.fromJson({
//      DbHelper.productsColumnName:name,
//      DbHelper.productsColumnPriceName:price,
//      DbHelper.productsColumnCategoryName:dropdownValue,
//      DbHelper.productsColumnDescName:description,
//    });
//    DbHelper.dbHelper.insertNewProduct(product);
  }

  @override
  Widget build(BuildContext context) {
//    this.context = context;
    return Builder(builder: (context){
      return Form(
          key: formKey,
          child: Transform.translate(
              offset: Offset(20.0, 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Product Name',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right:30),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        height: 30,
                        child: TextFormField(
                          validator:(value){
                            if(value.isEmpty){
                              return "Product Name is required";
                            }
                          },onSaved: (newValue){
                          setName(newValue);
                        },
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Product Category',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    new Container(
                        width: 375,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: const Color(0x73000000), fontSize: 18),
                          underline: Container(
                            height: 2,
                            color:  const Color(0x73000000),
                          ),
                          onChanged: (String data) {
                            setState(() {
                              dropdownValue = data;
                            });
                          },
                          items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Product Price',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right:30),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        height: 30,
                        child: TextFormField(
                          validator:(value){
                            if(value.isEmpty){
                              return "Product Name is required";
                            }
                          },onSaved: (newValue){
                          setPrice(newValue);
                        },
                        )),
                    new Container(
                        margin: EdgeInsets.only(top:35),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: const Color(0x73000000),
                            height: 1.75,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(right:30),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        height: 30,
                        child: TextFormField(
                            validator: (value){
                              if(value.isEmpty){
                                return "Description is required";
                              }
                            },onSaved: (newValue){
                          setDescription(newValue);
                        })
                    ),

                    Container(
                        margin: EdgeInsets.only(top:40),
                        width: 385.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.0, 0.0),
                            end: Alignment(-1.0, 0.0),
                            colors: [
                              const Color(0xff58a1ff),
                              const Color(0xff6b7fff)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000e44),
                              offset: Offset(0, 8),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: FlatButton(
                            child: Text(
                              "Pick Image",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            )))
                    ,
                    Container(
                        margin: EdgeInsets.only(top:40),
                        width: 385.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.0, 0.0),
                            end: Alignment(-1.0, 0.0),
                            colors: [
                              const Color(0xff58a1ff),
                              const Color(0xff6b7fff)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000e44),
                              offset: Offset(0, 8),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: FlatButton(
                            onPressed: () {
                              saveMyForm();
                            },
                            child: Text(
                              "Add Product",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            )))

                  ])
          ));
    });


  }
}

class ProductDetails extends StatefulWidget{
//    Product product;
//  ProductDetails({this.product});
    final Product recordObject;
//    ProductDetails({Key key, @required this.recordObject}) : super(key: key);
    const ProductDetails(this.recordObject);

    @override
 State<StatefulWidget> createState() {
    return ProductDetailsState(recordObject);
  }
}
class ProductDetailsState extends State<ProductDetails> {
  Product  recordObject;
  ProductDetailsState(this.recordObject);
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
                  return Main();
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
                    return Cart(recordObject);
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
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('images/cover.jpg'))),
              Container(
                child: Text(recordObject.name, style: TextStyle(fontSize: 25,)),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),

              Container(
                child: Text('\$ '+recordObject.price, style: TextStyle(fontSize: 17, color: Colors.blue)),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height:1.0,
                  color:Colors.grey,),

              Container(
                child: Text('Description', style: TextStyle(fontSize: 18,)),
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),

              Container(
                child: Text(recordObject.desc, style: TextStyle(fontSize: 16,)),
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10),
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

class Cart extends StatefulWidget{

  final Product recordObject;
  const Cart(this.recordObject);
  @override
  State<StatefulWidget> createState() {
    return CartState(recordObject);
  }
}
class CartState extends State<Cart>{
  // ignore: non_constant_identifier_names
  Product recordObject;
  CartState(this.recordObject);
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetails(recordObject);
                  }));
                }));
              },
            ),

          ),
          bottomNavigationBar:
          Container(
            margin: EdgeInsets.only(left:10,right:10),
            child: RaisedButton(
              child: Text('Continue', style: TextStyle(color: Colors.white)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return CreateAddress();
                }));
              },
              color: Colors.blue,
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
          }),
        )
    );
  }
}

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
    return Container(
      height: 120,
    child:Card(
      child: ListTile(
        leading:  Container(
          height: 120,
            child: Image.asset('images/cover.jpg', width: 70, height: 120,fit: BoxFit.fill)
        ),
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
              padding: EdgeInsets.symmetric(vertical: 5),
              onPressed: (){}),
        ],),
      ),



    ));


  }

}




