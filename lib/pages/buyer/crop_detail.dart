import 'package:flutter/material.dart';
import 'package:khetihar/pages/farmer/updatecrop.dart';
import 'package:khetihar/pages/farmer/your_crops.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/crop.dart';
import 'new_request.dart';

class CropDetail extends StatefulWidget {
  final Crop crop;
  const CropDetail({Key? key, required this.crop}) : super(key: key);

  @override
  State<CropDetail> createState() => _CropDetailState();
}

class _CropDetailState extends State<CropDetail> {
  bool first = true;
  String status = "Waiting";
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
                      child: "Base Price".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: widget.crop.price.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Stock Available".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: widget.crop.stock.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Location".text.xl.bold.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: widget.crop.location.text.xl.bold.green700.make(),
                    ).pOnly(left: 40),
                    10.heightBox,
                    // button for buying screen width

                    first
                        ? ElevatedButton(
                            // uppdate screen
                            onPressed: () {
                              first = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // pass crop as argument
                                  builder: (context) =>
                                      NewRequest(crop: widget.crop),
                                ),
                              );
                              setState(() {});
                            },
                            child:
                                "I am interested in buying".text.xl.bold.make(),
                          ).wFull(context).pOnly(left: 40, right: 40, top: 20)
                        : ElevatedButton(
                            // change color
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 201, 135, 54),
                            ),
                            // uppdate screen
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // pass crop as argument
                                  builder: (context) =>
                                      NewRequest(crop: widget.crop),
                                ),
                              );
                              first = false;
                            },
                            child:
                                "Request Status : $status".text.xl.bold.make(),
                          ).wFull(context).pOnly(left: 40, right: 40, top: 20),
                    // button for buying screen width red color
                  ],
                ).py32()),
          ),
        ]),
      ).pOnly(top: context.percentHeight * 10),
    );
  }
}
