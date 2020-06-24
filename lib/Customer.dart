import './database_control.dart';
class Customer{
  int Id;
  String username;
  String password;
  String email;
  String type;

  Customer({
   this.Id,
    this.username,this.email,this.password,this.type});

  factory Customer.fromJson(Map<String,dynamic> json)=>Customer(
   Id: json[DbHelper.usersColumnIdName],
    username: json[DbHelper.usersColumnUserName],
    password: json[DbHelper.usersColumnPasswordName],
    email: json[DbHelper.usersColumnEmailName],
    type: json[DbHelper.usersColumnTypeName]);

  Map<String,dynamic> toMap(){
    return {
      DbHelper.usersColumnUserName: username,
      DbHelper.usersColumnPasswordName: password,
      DbHelper.usersColumnEmailName: email,
      DbHelper.usersColumnTypeName: type
    };
  }

}