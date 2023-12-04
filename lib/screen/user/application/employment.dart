import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/component/text_field.dart';
import 'package:job_box/util/color.dart';

class Employment extends StatefulWidget {
  Employment(
      {super.key,
      required this.height,
      required this.width,
      required this.nextPage,
      required this.school,
      required this.study,
      required this.year,
      required this.educationSwitch,
      required this.experienceSwitch});

  final double height;
  final double width;
  final Function nextPage;
  String school, study, year;
  bool experienceSwitch, educationSwitch;

  @override
  State<Employment> createState() => _EmploymentState();
}

class _EmploymentState extends State<Employment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          ListTile(
            contentPadding:EdgeInsets.zero,
              title: const Text("Education",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              subtitle: const Text("Included in Resume", style:TextStyle(color:Colors.black)),
              trailing: CupertinoSwitch(
                value: widget.educationSwitch,
                activeColor: darkGreyColor,
                onChanged: (bool value) {
                  setState(() {
                    widget.educationSwitch = value;
                  });
                },
              )),
          SizedBox(
            height: widget.height * 0.015,
          ),
          if(widget.educationSwitch == false)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Text("Name of school"),
          SizedBox(
            height: widget.height * 0.01,
          ),
          textFields(widget.school),
          SizedBox(
            height: widget.height * 0.02,
          ),
          const Text("Course of study"),
          SizedBox(
            height: widget.height * 0.01,
          ),
          textFields(widget.study),
          SizedBox(
            height: widget.height * 0.015,
          ),
          const Text("Year graduated"),
          SizedBox(
            height: widget.height * 0.01,
          ),
          textFields(widget.year),
          ],),
          SizedBox(
            height: widget.height * 0.02,
          ),
          ListTile(
             contentPadding:EdgeInsets.zero,
              title: const Text("Work Experience",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              subtitle: const Text("Included in Resume"),
              trailing: CupertinoSwitch(
                value: widget.experienceSwitch,
                activeColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    widget.experienceSwitch = value;
                  });
                },
              )),
          SizedBox(
            height: widget.height * 0.02,
          ),
          const Text("Additional Skills", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
           SizedBox(
            height: widget.height * 0.02,
          ),
          SearchBar(
            leading: const Icon(
              Icons.search,
              size: 30,
              color: greyColor,
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            elevation: MaterialStateProperty.all(0),
            constraints: const BoxConstraints(maxHeight: 1000),
            padding: const MaterialStatePropertyAll(EdgeInsets.only(top:5, bottom:5, left:10)),
            hintText: "Search for Skills",
            hintStyle:
               const MaterialStatePropertyAll(TextStyle(color: brownColor)),
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: brownColor, width: 1),
            )),
          ),
      ]),
        )),
          Container(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
               width: widget.width,
              height: widget.height * 0.06,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: lightOrangeColor,
                ),
                child: Text(
                  "Proceed",
                   style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                   ),
                ),
                onPressed: () {
                  widget.nextPage();
                },
              ),
               
                ),
            ),
          ),
        ],
      );
  }
}