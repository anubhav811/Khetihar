import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetihar/pages/buyer/login.dart';
import 'package:khetihar/pages/farmer/login.dart';
import 'package:khetihar/pages/farmer/profile.dart';
import 'package:khetihar/pages/farmer/signup.dart';
import 'package:khetihar/pages/farmer/your_crops.dart';

import 'farmer_req.dart';

class FarmerHomePage extends StatefulWidget {
  @override
  FarmerHomePageState createState() => FarmerHomePageState();
}

class FarmerHomePageState extends State<FarmerHomePage> {
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return YourCrops();
      case 1:
        return FarmerRequests();
      case 2:
        return FarmerProfile();

      default:
        return new Text("Error");
    }
  }

  List<String> titleList = ["Your Crops", "Received Requests", "Profile"];

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titleList[_currentIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("KhetiHar"), accountEmail: Text("")),
            ListTile(
              title: Text("Log Out"),
              onTap: () {
                //alert dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Log Out"),
                        content: Text("Are you sure you want to log out?"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text("Yes"),
                            onPressed: () {
                              Navigator.popUntil(
                                  context, ModalRoute.withName("/"));
                            },
                          ),
                          ElevatedButton(
                            child: Text("No"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Your Crops",
          ),
          BottomNavigationBarItem(
            label: "Received Requests",
            icon: Icon(Icons.note),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    );
  }
}
