import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FarmerLogin extends StatelessWidget {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                200.heightBox,
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter your number",
                          labelText: "Phone No",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone No is empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // check if the value has any alphanumeric characters
                          if (value.contains(RegExp(r'[a-zA-Z0-9]'))) {
                            name = value;
                          }
                          if (value.isEmpty) {
                            name = "";
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is empty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6";
                          }
                          return null;
                        },
                      ),
                      200.heightBox,
                      Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          // onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            width: context.screenWidth,
                            height: 50,
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 500),
                            child: const Text("Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
