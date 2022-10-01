import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // add rounded image from assets

            ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image(
                image: Image.asset("assets/images/logo.png").image,
                height: 200,
                width: 200,
              ),
            ),
            // add some space
            20.heightBox,
            // add text
            "Khetihar".text.xl5.bold.make(),
            ButtonBar(
              // increase button size
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(30),
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/flogin");
                  },
                  // curved button

                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(33, 150, 83, 1)),
                  ),
                  child: "Farmer".text.make(),
                ),
                ElevatedButton(
                  onPressed: () {
                    // navigate to login page
                    Navigator.pushNamed(context, "/blogin");
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(33, 150, 83, 1))),
                  child: "Buyer".text.make(),
                ),
              ],
            ),
          ]),
        ));
  }
}
