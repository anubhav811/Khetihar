import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetihar/pages/farmer/chat.dart';
import 'package:khetihar/pages/farmer/updatecrop.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/crop.dart';

class RequestPage extends StatefulWidget {
  // add argument
  final Crop crop;
  const RequestPage({super.key, required this.crop});
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add floating action button with plus sign
      appBar: AppBar(
        title: Text("Crop Details"),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(widget.crop.id.toString()),
                  child: Image.network(widget.crop.image).cornerRadius(300))
              .h20(context),
          Expanded(
            child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    widget.crop.name.text.xl5
                        .color(context.accentColor)
                        .bold
                        .make(),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Buyer Name".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Krina".text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Stock Required".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: widget.crop.stock.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,

                    Align(
                      alignment: Alignment.topLeft,
                      child: "Buyer Pincode".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "120311".text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    // button for buying screen width

                    !accepted
                        ? Column(children: [
                            ElevatedButton(
                              // uppdate screen
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Accept Request"),
                                        content: const Text(
                                            "Are you sure you want to accept this request?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // go back to homescreen
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              accepted = true;
                                              Navigator.pop(context);

                                              setState(() {});
                                            },
                                            child: const Text("Accept"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: "Accept".text.xl.bold.make(),
                            )
                                .wFull(context)
                                .pOnly(left: 40, right: 40, top: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              // create alert dialog box
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Reject Request"),
                                        content: const Text(
                                            "Are you sure you want to reject this request?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // go back to homescreen
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text("Reject"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: "Reject".text.xl.bold.make(),
                            ).wFull(context).pOnly(left: 40, right: 40)
                          ]).py32()
                        : ElevatedButton(
                            // uppdate screen
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Chat()));
                              //     });
                            },
                            child: "Chat With Buyer".text.xl.bold.make(),
                          ).wFull(context).pOnly(left: 40, right: 40, top: 20),
                  ],
                )),
          ),
        ]),
      ).pOnly(top: context.percentHeight * 10),
    );
  }
}
