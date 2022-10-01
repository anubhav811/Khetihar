import 'package:flutter/material.dart';
import 'package:khetihar/pages/farmer/updatecrop.dart';
import 'package:khetihar/pages/farmer/your_crops.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/crop.dart';

class CropDetail extends StatelessWidget {
  final Crop crop;
  const CropDetail({Key? key, required this.crop}) : super(key: key);
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
                  tag: Key(crop.id.toString()),
                  child: Image.network(crop.image).cornerRadius(300))
              .h20(context),
          Expanded(
            child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    crop.name.text.xl5.color(context.accentColor).bold.make(),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Base Price".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: crop.price.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Stock Available".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: crop.stock.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Location".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: crop.location.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    // button for buying screen width

                    ElevatedButton(
                      // uppdate screen
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // pass crop as argument
                            builder: (context) => UpdateCrop(crop: crop),
                          ),
                        );
                      },
                      child: "Update".text.xl.bold.make(),
                    ).wFull(context).pOnly(left: 40, right: 40, top: 20),
                    // button for buying screen width red color
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
                                title: const Text("Delete Crop"),
                                content: const Text(
                                    "Are you sure you want to delete this crop?"),
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
                                      CropCatalog.crops.remove(crop);
                                      Navigator.popUntil(context,
                                          ModalRoute.withName("/fhome"));
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              );
                            });
                      },
                      child: "Delete".text.xl.bold.make(),
                    ).wFull(context).pOnly(left: 40, right: 40),
                  ],
                ).py32()),
          ),
        ]),
      ).pOnly(top: context.percentHeight * 10),
    );
  }
}
