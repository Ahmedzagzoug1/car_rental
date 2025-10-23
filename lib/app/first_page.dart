import 'dart:async';

import 'package:car_rental/core/routes/app_router.dart';
import 'package:flutter/material.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
   /* Timer(Duration(seconds: 3), (){
    //  Navigator.pushReplacementNamed(context, AppRouter.homeRoute);
    });*/
    // TODO: implement initState
    super.initState();
    final start = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(" FirstPage built in: ${DateTime.now().difference(start).inMilliseconds} ms");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('First Page')),
      body: Text('hello'),
    );
  }
}
