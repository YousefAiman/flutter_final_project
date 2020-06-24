import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinalproject/Customer.dart';
import 'package:flutterfinalproject/Product.dart';
import 'package:flutterfinalproject/database_control.dart';

import 'Login.dart';
void main() => runApp(AddProduct());

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

class  AddOrderFormState extends State<AddOrderForm> {
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
    saveMyForm(){
    if(!formKey.currentState.validate()){
      return;
    }
    formKey.currentState.save();
    DbHelper.dbHelper.database;
    Product product =  Product.fromJson({
      DbHelper.productsColumnName:name,
      DbHelper.productsColumnPriceName:price,
      DbHelper.productsColumnCategoryName:dropdownValue,
      DbHelper.productsColumnDescName:description,
    });
    DbHelper.dbHelper.insertNewProduct(product);
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

