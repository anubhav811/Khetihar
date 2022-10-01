import 'package:flutter/material.dart';
import 'package:khetihar/models/crop.dart';
import 'package:velocity_x/velocity_x.dart';

class AddCrop extends StatefulWidget {
  // make controllers

  // final TextEditingController imageController = TextEditingController();

  @override
  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Crop"),
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
                            title: const Text("Add Crop"),
                            content: const Text(
                                "Are you sure you want to add this crop?"),
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
                                      SnackBar(
                                          content:
                                              Text('Crop added successfully')));
                                  // go back
                                  // clear field
                                  nameController.clear();
                                  priceController.clear();
                                  stockController.clear();
                                  locationController.clear();
                                  Navigator.pop(context);

                                  // Navigator.popAndPushNamed(context, "/fhome");
                                },
                                child: const Text("Add"),
                              ),
                            ],
                          );
                        });

                    // show success message
                  },
                  child: "Add Crop".text.make(),
                ).wFull(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
