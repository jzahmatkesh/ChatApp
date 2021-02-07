import 'dart:convert';

import 'package:chat/module/fucntions.dart';
import 'package:flutter/material.dart';

class User{
  int _id;
  String _name;
  String _family;
  String _mobile;
  String _token;

  User({@required int id, String name, String family, String mobile, @required String token}){
    this._id = id;
    this._name = name;
    this._family = family;
    this._mobile = mobile;
    this._token = token;
  }

  static Future<User> authenticate(String username, String password) async{
    Map<String, dynamic> _res = await postToServer(api: 'Authenticate', body: {'mobile': username,  'password': password});
    if (_res['msg'] == "Success")
      return User(id: json.decode(_res['body'])['id'], name: json.decode(_res['body'])['name'], family: json.decode(_res['body'])['family'], mobile: json.decode(_res['body'])['mobile'], token: json.decode(_res['body'])['token']);
    throw Exception(_res['msg']);
  }

  int get id  => this._id;
  String get token  => this._token;
  String get name  => this._name;
  String get family  => this._family;
  String get mobile  => this._mobile;
}