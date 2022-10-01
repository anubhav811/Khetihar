import 'package:flutter/material.dart';
import 'package:khetihar/models/crop.dart';
import 'package:velocity_x/velocity_x.dart';

class NewRequest extends StatefulWidget {
  final Crop crop;

  const NewRequest({super.key, required this.crop});

  // final TextEditingController imageController = TextEditingController();

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String status = "Waiting";
  bool first = true;

  // @override
  // void initState() {
  //   super.initState();
  //   first = true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request for ${widget.crop.name}"),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  // create key
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Your Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: _formKey,
                  controller: stockController,
                  decoration: InputDecoration(
                    labelText: "Stock Required",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter crop quantity";
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: "Your Pincode",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your pincode";
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
                            title: const Text("Send Request"),
                            content: const Text(
                                "Are you sure you want to send this request?"),
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
                                          content: Text(
                                              'Request sent successfully')));
                                  // go back
                                  // clear field

                                  Navigator.pop(context);
                                  first = false;
                                  setState(() {});
                                  // Navigator.popAndPushNamed(
                                  //     context, "/bhome");
                                },
                                child: const Text("Send"),
                              ),
                            ],
                          );
                        });

                    // show success message
                  },
                  child: "Send Request".text.make(),
                ).wFull(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
