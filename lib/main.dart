import 'package:designer_patters_singleton/singleton_pattern.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      /*
          SingletonPattern - Tem que trazer duas coisas.
          1. Uma classe Singleton, ela deve ter apenas "uma" instacia para tod0 o sistema
             . Isso é importante para voce controlar o que ela esta acessando.
       */
      home: SingletonPattern(),
    );
  }
}
