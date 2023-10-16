// ignore_for_file: prefer_const_constructors

import 'package:assignment/provider/auth.dart';
import 'package:assignment/widgets/add_doctor.dart';
import 'package:assignment/widgets/custom_text.dart';
import 'package:assignment/widgets/settings_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/caretake_tiles.dart';
import '../../widgets/condition_texts.dart';
import '../../widgets/device_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                ),
                title: Text(
                  'Take Care!',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Richa Bose',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                thickness: 0.5,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomText(title: 'Settings'),
                    SettingsTile(),
                    const CustomText(title: 'Device'),
                    DeviceTile(),
                    CustomText(title: 'Caretakers: 03'),
                    CareTakTile(),
                    const CustomText(title: 'Doctor'),
                    AddDoctor(),
                    SizedBox(
                      height: 10,
                    ),
                    ConditionTexts(),
                    // CustomText(
                    //   title: 'Privacy Policy',
                    //   padding: true,
                    // ),
                    // CustomText(
                    //   title: 'Terms of Use',
                    //   padding: true,
                    // ),
                    // CustomText(
                    //   title: 'Rate Us',
                    //   padding: true,
                    // ),
                    // CustomText(
                    //   title: 'Share',
                    //   padding: true,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  side: BorderSide(color: Colors.blueAccent)),
                              onPressed: () {
                                Auth(loading: (bool loading) {}).signOut();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
