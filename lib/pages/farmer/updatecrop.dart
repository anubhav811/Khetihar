import 'package:flutter/material.dart';
import 'package:khetihar/models/crop.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateCrop extends StatefulWidget {
  //  one argument as Crop
  final Crop crop;

  const UpdateCrop({super.key, required this.crop});

  @override
  _UpdateCropState createState() => _UpdateCropState();
}

class _UpdateCropState extends State<UpdateCrop> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.crop.name;
    priceController.text = widget.crop.price;
    stockController.text = widget.crop.stock;
    locationController.text = widget.crop.location;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Crop"),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  // create key
                  key: _formKey,
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Crop Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter crop name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: stockController,
                  decoration: InputDecoration(
                    labelText: "Stock Available",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter crop quantity";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: "Base Price",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter crop price";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: "Add Location",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter crop description";
                    }
                    return null;
                  },
                ),
                // add image button

                30.heightBox,
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    // add crop
                    // creat alert dialog

                    // show alert dialog

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Update Crop"),
                            content: const Text(
                                "Are you sure you want to make these changes?"),
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
                                  CropCatalog.crops.add(Crop(
                                      id: CropCatalog.crops.length + 1,
                                      name: nameController.text,
                                      price: priceController.text,
                                      stock: stockController.text,
                                      location: locationController.text,
                                      image: ''));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Crop updated successfully')));
                                  // go back
                                  // clear field
                                  Navigator.pop(context);

                                  // Navigator.popAndPushNamed(context, "/fhome");
                                },
                                child: const Text("Update"),
                              ),
                            ],
                          );
                        });
                  },
                  child: "Update Crop".text.make(),
                ).wFull(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
