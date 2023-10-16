import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isDeviceConnected = false;

  Future<void> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isDeviceConnected = true;
        });
      }
    } on SocketException catch (_) {
      // If the lookup fails, set the isConnected flag to false
      setState(() {
        isDeviceConnected = false;
      });
    }
  }

  // A method to show a dialog box based on the connectivity status
  void showConnectionDialog(BuildContext context) {
    // Create a dialog widget
    Widget dialog = AlertDialog(
      title: Text(isDeviceConnected ? 'Connected' : 'Not Connected'),
      content: Text(isDeviceConnected
          ? 'You have internet access.'
          : 'You do not have internet access.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      checkInternetConnection();
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      isDeviceConnected
                          ? 'Your Device is connected'
                          : 'Your Device is not\nconnected',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: Image.asset(
                        isDeviceConnected ? 'assets/dn.png' : 'assets/robo.png',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                    Text(
                      isDeviceConnected
                          ? 'Good connection'
                          : 'Connect your devicess with',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0))),
                      child: Icon(
                        Icons.bluetooth,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25.0))),
                      child: Icon(
                        Icons.wifi,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
