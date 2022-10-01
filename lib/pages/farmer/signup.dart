import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FarmerSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // show page name,
        appBar: AppBar(
          title: "Farmer Login".text.make(),
        ),
        body: const Center(child: Text("Farmer Login")));
  }
}
