import 'dart:io';
import 'package:flutterfinalproject/Customer.dart';
import 'package:flutterfinalproject/Product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbHelper{
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();
  static Database _database;


  String dbName = 'ProjectDb';
  String usersTableName = 'users';
  static String usersColumnIdName = 'userId';
  static String usersColumnUserName = 'userName';
  static String usersColumnPasswordName = 'userPassword';
  static String usersColumnEmailName = 'userEmail';
  static String usersColumnTypeName = 'userType';
  static String usersColumnOrdersName = 'userOrders';
  static String usersColumnProductsName = 'userProducts';

  String productsTableName = 'products';

  static String productsColumnIdName = 'productId';
  static String productsColumnName = 'productName';
  static String productsColumnCategoryName = 'productCategory';
  static String productsColumnDescName = 'productDesc';
  static String productsColumnPriceName = 'productPrice';


  Future<Database> get database async{
    if(_database!=null){
      return _database;
    }else{
      _database = await initDb();
      return _database;
    }
  }

  initDb() async {
    try{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path =join(appDocDir.path,'ProjectDb.db');
    return await openDatabase(
      path,
      version: 1
    );
    } catch (error){
      print(error);
    }
  }

  createTable() async {
    Database db = await database;
    await db.execute(''' 
    CREATE TABLE IF NOT EXISTS $usersTableName(
    $usersColumnIdName INTEGER PRIMARY KEY AUTOINCREMENT,
    $usersColumnUserName TEXT,
    $usersColumnPasswordName TEXT,
    $usersColumnEmailName TEXT,
    $usersColumnTypeName TEXT,
    $usersColumnOrdersName TEXT,
    $usersColumnProductsName TEXT)
    ''');
  }
  createProductsTable() async {
    Database db = await database;
    await db.execute(''' 
    CREATE TABLE IF NOT EXISTS $productsTableName(
    $productsColumnIdName INTEGER PRIMARY KEY AUTOINCREMENT,
    $productsColumnName TEXT,
    $productsColumnPriceName TEXT,
    $productsColumnCategoryName TEXT,
    $productsColumnDescName TEXT)
    ''');
  }
  insertNewUserRaw(Customer customer) async{
    Database db = await database;
    await createTable();
    try {await db.rawInsert('''INSERT INTO $usersTableName ($usersColumnUserName,$usersColumnPasswordName,$usersColumnEmailName,$usersColumnTypeName)
    VALUES (?,?,?,?)''',[customer.username,customer.password,customer.email,customer.type]);}catch(error){
      print(error);
    }
  }
  insertNewUser(Customer customer) async{
    Database db = await database;
    db.insert(usersTableName, customer.toMap());
  }

  insertNewProductRaw(Product product) async{
    Database db = await database;
    await createProductsTable();
    try {await db.rawInsert('''INSERT INTO $productsTableName ($productsColumnName,$productsColumnPriceName,$productsColumnCategoryName,$productsColumnDescName)
    VALUES (?,?,?,?)''',[product.name,product.price,product.category,product.desc]);}catch(error){
      print(error);
    }
  }
  insertNewProduct(Product product) async{
    await createProductsTable();
    Database db = await database;
    await db.insert(productsTableName, product.toMap());
  }
  Future<bool> retrieveUserData(String userEmail,String password) async{
    Database db = await database;
   List<Map<String,dynamic>> usersResult =
//   await db.rawQuery('''SELECT * FROM $usersTableName ''');
   await db.query(usersTableName,where: '$usersColumnEmailName=? and $usersColumnPasswordName=?',whereArgs: [userEmail,password]);
   List<Customer> customers = usersResult.map((item)=>Customer.fromJson(item)).toList();
//   for(Customer customer in customers){
//     if(customer.email!=null && customer.password!=null){
//       print(customer.email+"-"+customer.password);
//     }
//   }

//
//     return usersResult;
//     print(customers);

    if(customers.length > 0) {
      return Future.value(true);
    }else{
      return Future.value(false);
    }
  }
  Future<List<Product>> retrieveAllProducts() async{
    Database db = await database;
    List<Map<String,dynamic>> productsResult =
  await db.rawQuery('''SELECT * FROM $productsTableName ''');
//    await db.query(productsTableName);
    List<Product> products = productsResult.map((item)=>Product.fromJson(item)).toList();
//   for(Customer customer in customers){
//     if(customer.email!=null && customer.password!=null){
//       print(customer.email+"-"+customer.password);
//     }
//   }

//
//     return usersResult;
//     print(customers);
    if(products.length > 0) {
      return Future.value(products);
    }
  }
}
