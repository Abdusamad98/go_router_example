import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/route.dart';
import 'package:go_router_example/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: myRouter);
  }
}






