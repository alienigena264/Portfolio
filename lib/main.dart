import 'package:flutter/material.dart';
import 'package:portafolio/UI/layouts/home_layout.dart';
import 'package:portafolio/UI/view/home_view.dart';
import 'package:portafolio/UI/view/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Juan Garcia | Mobile developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(colorSelected: 0).getTheme(),
      home:  const HomeLayout(child: HomeView(),)

    );
  }
}