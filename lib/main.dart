import 'package:chat/module/MyProvider.dart';
import 'package:chat/screens/HomePage.dart';
import 'package:chat/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>MyProvider()),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: context.watch<MyProvider>().user == null
        ? Login()
        : HomePage()
    );
  }
}

