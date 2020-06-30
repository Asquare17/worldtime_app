import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/location.dart';

void main() {
  runApp(MaterialApp(

    routes: {
      '/':(context)=> Loading(),
      '/home':(context)=> Home(),
      '/location':(context)=> Location(),
    },

  ));
}
