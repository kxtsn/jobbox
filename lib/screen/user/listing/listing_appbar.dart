import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/util/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.screenHeight,
    required this.scrolledUnderElevation,
    required this.name,
  });

  final double screenHeight;
  final double? scrolledUnderElevation;
  final String name;

  @override
  Size get preferredSize => Size.fromHeight(screenHeight * 0.27);

  TabBar get _tabBar =>  TabBar(
          labelColor: orangeColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize:16),
          unselectedLabelColor: greyColor,
          indicatorColor: orangeColor,
          indicatorPadding: const EdgeInsets.only(bottom: 13),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(borderRadius:BorderRadius.circular(8),
         
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 3.5, 
      ),
      insets: const EdgeInsets.only(bottom: -3), 
    ),
  
          tabs: const [
             Tab(
              text: "Recent Jobs",
            ),
             Tab(
              text: "Near You",
            )
          ]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: orangeColor,
      toolbarHeight: screenHeight * 0.2,
      elevation: 0,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: scrolledUnderElevation,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Hi $name ",
                  style: const TextStyle(color: brownColor, fontSize: 15)),
              WidgetSpan(
                  child: Transform.flip(
                flipX: true,
                child: const Icon(
                  Icons.waving_hand_rounded,
                  size: 14,
                  color: Color(0xFFE6D5B8),
                ),
              )),
             const TextSpan(
        text: " ",
        style: TextStyle(fontSize:30),
      ),
               TextSpan(
                  text: "\nFind The Best Job Here!",
                  style: GoogleFonts.autourOne(textStyle: const TextStyle(color: brownColor, fontSize: 22, fontWeight: FontWeight.w600)))
            ]),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          SearchBar(
            leading: Icon(
              Icons.search,
              size: 30,
              color: brownColor.withOpacity(0.7),
            ),
            backgroundColor: const MaterialStatePropertyAll(peachColor),
            elevation: MaterialStateProperty.all(0),
            constraints: const BoxConstraints(maxHeight: 1000),
            padding: const MaterialStatePropertyAll(EdgeInsets.only(top:5, bottom:5, left:10)),
            hintText: "Start searching for jobs",
            hintStyle:
                MaterialStatePropertyAll(TextStyle(color: brownColor.withOpacity(0.7))),
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
          ),
       
        ],
      ),
      bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: ColoredBox(color: offWhiteColor, child: _tabBar)),
    );
  }
}