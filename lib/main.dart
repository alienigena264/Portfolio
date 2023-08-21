import 'package:flutter/material.dart';
import 'package:portafolio/UI/layouts/home_layout.dart';
import 'package:portafolio/UI/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      title: 'Juan Garcia | Mobile developer',
      debugShowCheckedModeBanner: false,
      home:  HomeLayout(child: HomeView(),)

    );
  }
}