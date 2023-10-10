import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This is home screen"),
        ElevatedButton(
            onPressed: () => context.go("/"),
            child: Text("Go to Splash Screen ")),
        ElevatedButton(
          onPressed: () => context.goNamed(
            "details_screen",
            queryParams: {
              "a": "Abdulloh",
              "b": "16",
            },
            extra: {
              "my_order": MyOrder(),
              "a": "Abdulloh",
              "b": 16,
            },
          ),
          child: Text("Go to Detail Screen "),
        ),
        ElevatedButton(
            onPressed: () => context.go("/home_screen/home_detail"),
            child: Text("Go to Home Detail Screen ")),
      ],
    ));
  }
}

class MyOrder {
  String test = "TEST";
}
