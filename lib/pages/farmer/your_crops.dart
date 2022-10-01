import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khetihar/models/crop.dart';
import 'package:velocity_x/velocity_x.dart';

class YourCrops extends StatefulWidget {
  @override
  YourCropsState createState() => YourCropsState();
}

class YourCropsState extends State<YourCrops> {
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final cropJson = await rootBundle.loadString("assets/files/crops.json");
    final decodedData = jsonDecode(cropJson);
    var cropsData = decodedData["crops"];
    CropCatalog.crops =
        List.from(cropsData).map<Crop>((item) => Crop.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (CropCatalog.crops != null && CropCatalog.crops.isNotEmpty)
                CropList().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}

class CropList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        final crop = CropCatalog.crops[index];
        return InkWell(
          // onTap: () => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CropDetailPage(catalog: catalog),
          //   ),
          // ),
          child: CropItem(crop: crop),
        );
      },
    );
  }
}

class CropItem extends StatelessWidget {
  final Crop crop;

  const CropItem({Key? key, required this.crop})
      : assert(crop != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          // Hero(
          //   tag: Key(crop.id.toString()),
          //   // child: CatalogImage(
          //   //   // image: crop.image,
          //   // ),
          // ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              crop.name.text.lg.color(context.accentColor).bold.make(),
              Row(children: [
                "Base Price:".text.make(),
                crop.price.text.textStyle(context.captionStyle).make(),
              ]),
              crop.stock.text.textStyle(context.captionStyle).make(),
              10.heightBox,
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

// class CatalogImage extends StatelessWidget {
//   final String image;

//   const CatalogImage({Key? key, required this.image}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       image,
//     ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
//   }
// }
