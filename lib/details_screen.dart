import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.a,
    required this.b, required this.myOrder,
  }) : super(key: key);

  final String a;
  final int b;
  final MyOrder myOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go("/home_screen");
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body:  Center(
        child: Text("This is a details screen: $a va $b  ${myOrder.test}"),
      ),
    );
  }
}
