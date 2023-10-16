import 'package:assignment/screens/add_medicine/add_medicine_screen.dart';
import 'package:assignment/screens/home_screen/home_screen.dart';
import 'package:assignment/widgets/report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    HomeScreen(),
    // AddMedicine(),
  //  ConnectionScreen(),
  ];

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return ReportScreen();
        });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              onPressed: () => _onItemTapped(0),
            ),
            // IconButton(
            //   icon: Icon(Icons.show_chart),
            //   color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            //   onPressed: () => _onItemTapped(1),
            // ),
            //  SizedBox(width: 48.0), // The dummy space for the floating action button
            // IconButton(
            //   icon: Icon(Icons.tab),
            //   color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            //   onPressed: () => _onItemTapped(2),
            // ),
            IconButton(
              icon: Icon(
                Icons.signal_cellular_connected_no_internet_0_bar,
                size: 30,
              ),
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              onPressed: () {
              //  _onItemTapped(2);
                _displayDialog(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: _selectedIndex == 1 ? Colors.blue : Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          // _onItemTapped(1);
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddMedicine()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
