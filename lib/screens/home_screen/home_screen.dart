import 'package:assignment/provider/medicines.dart';
import 'package:assignment/screens/home_screen/widgets/dashboard.dart';
import 'package:assignment/screens/home_screen/widgets/history.dart';
import 'package:assignment/screens/home_screen/widgets/report_card.dart';
import 'package:assignment/screens/profile/profile_screen.dart';
import 'package:assignment/widgets/custom_text.dart';
import 'package:assignment/widgets/medicine_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/circular_progress_bar.dart';
import 'widgets/calendar.dart';
import 'widgets/week_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final medicines = Provider.of<Medicines>(context).medicines;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: CustomText(title: 'Hi ${auth.currentUser!.displayName}'),
          subtitle: Text(
            '5 Medicines Left',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.medical_services_rounded,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: CircleAvatar()),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomText(title: 'Report'),
                ReportCard(),
                Dashboard(),
                History(),
                const Text(
                  'Morning 08:00 am',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: medicines.length,
                    itemBuilder: (ctx, index) {
                      final item = medicines[index];
                      return MedicineTile(
                          subtitle: '${item.compartment}',
                          day: 01,
                          trailingIconColor: Colors.lightGreen,
                          trailingText: item.time,
                          leadingIcon: Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(item.color),
                              borderRadius: BorderRadius.circular(10.0),
                              // image: DecorationImage(image: NetworkImage(item.type))
                            ),
                            child: Image.network(
                              item.type,
                              fit: BoxFit.contain,
                            ),
                          ));
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Afternoon 02:00 pm',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                const MedicineTile(
                  subtitle: 'After Food \t\t\t Day 01',
                  day: 01,
                  trailingIconColor: Colors.lightGreen,
                  trailingText: 'Snoozed',
                  leadingIcon: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 30,
                    child: Icon(
                      CupertinoIcons.drop_fill,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Night 09:00 pm',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(height: 5),
                MedicineTile(
                    subtitle: 'Before Sleep',
                    day: 03,
                    trailingIconColor: Colors.teal,
                    trailingText: 'Left',
                    leadingIcon: Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                          color: Colors.redAccent[100],
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Icon(
                        Icons.medical_services_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
