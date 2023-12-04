import 'package:flutter/material.dart';

import 'package:job_box/util/color.dart';
import 'package:job_box/util/data.dart' as data;
import 'package:intl/intl.dart';

import 'package:job_box/screen/user/listing/applied.dart';
import 'package:job_box/screen/user/profile/profile.dart';
import 'package:job_box/screen/user/listing/listing_appbar.dart';
import 'package:job_box/screen/user/listing/listing.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool shadowColor = false;
  double? scrolledUnderElevation;
  int selectedNavBar = 0;

  String formatDisplayDate(String date) {
    if (date != "") {
      date = DateFormat("dd-MMM-yyyy").format(DateTime.parse(date)).toString();
      date = date.replaceAll('-', ' ');
    } else {
      date = "";
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    int topTab = 2;
    return DefaultTabController(
      initialIndex: 0,
      length: topTab,
      child: Scaffold(
        appBar: selectedNavBar == 0
            ? AppBarWidget(
                screenHeight: screenHeight,
                scrolledUnderElevation: scrolledUnderElevation,
                name: data.firstName,
              )
            : null,
        body: 
        IndexedStack(
          index: selectedNavBar,
          children: const [JobListings(), Applied(), Profile()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: orangeColor,
          unselectedItemColor: greyColor,
          onTap: (value) {
            selectedNavBar = value;
            setState(() {});
          },
          currentIndex: selectedNavBar,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: ('Job Listings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit), label: ('Applied Jobs')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: ('Profile')),
          ],
        ),
      ),
    );
  }
}
