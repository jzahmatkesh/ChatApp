import 'package:flutter/material.dart';

import 'User.dart';

class MyProvider with ChangeNotifier{
  bool loading = false;
  User user;

  setUser(User data){
    user = data;
    notifyListeners();
  }

  setLoading(bool i){
    loading = i;
    notifyListeners();
  }
}