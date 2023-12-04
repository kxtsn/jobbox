import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/util/color.dart';
import 'package:job_box/util/data.dart' as data;
import 'package:job_box/data/job.dart';


class Applied extends StatefulWidget {
  const Applied({super.key});

  @override
  State<Applied> createState() => _AppliedState();
}

class _AppliedState extends State<Applied> {
  List<Job> appliedList = data.applied;
  @override
  void initState() {
    super.initState();
  }

  String formatDisplayDate(DateTime? date) {
    String formattedDate = "";
    if (date != null) {
      formattedDate = DateFormat("dd MMM yyyy").format(date).toString();
    }
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
    minimum: const EdgeInsets.all(10),
    child: Container(
      color: offWhiteColor,
      child: Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            children: [
              Text(
                "Your Applied Jobs ",
               style: GoogleFonts.autourOne(
      textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            )
              ),
             const Icon(Icons.edit)
            ],
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Text(
              "You applied for ${appliedList.length} jobs", style:const TextStyle(color: greyColor, fontSize:16, fontWeight: FontWeight.w300)),
           SizedBox(
            height: screenHeight * 0.02,
          ),
          ListView.separated(
            itemCount: appliedList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(
                    top: 5, left: 0, right: 0, bottom: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appliedList[index].company.toUpperCase(),
                         style: const TextStyle(
                  color: orangeColor,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
                      Text(
                        formatDisplayDate(appliedList[index].listingDate),
                      style: const TextStyle(color: greyColor, fontSize: 12),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 4),
                        child: Text(
                          appliedList[index].title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                         const SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/money.svg',width:15,  color: darkGreyColor),
                 const SizedBox(width:5),
                          Text(
                    "${appliedList[index].salaryRange}/month",
                    style: const TextStyle(
                      color: darkGreyColor,
                      fontSize: 14
                    )),
                const SizedBox(width:15),
                Text(
                  appliedList[index].location,
                  style: const TextStyle(color: darkGreyColor,fontSize: 14),
                )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    )));
  }
}