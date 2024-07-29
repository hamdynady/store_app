import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/pages/home_page.dart';
import 'package:store/pages/update_product_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      routes:{
        HomePage.id : (context)=> const HomePage(),
        UpdateProductPage.id : (context)=>   UpdateProductPage(),
    },
      initialRoute:  HomePage.id,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),

      );

  }
}
