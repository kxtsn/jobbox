import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:job_box/util/color.dart';
import 'package:job_box/data/job.dart';
import 'package:job_box/util/data.dart' as data;

import 'package:job_box/screen/user/listing/listing_modal.dart';

class JobListings extends StatefulWidget {
  const JobListings({super.key});

  @override
  State<JobListings> createState() => _JobListingsState();
}

class _JobListingsState extends State<JobListings> {
  List<Job> jobListings = data.jobs;

  String formatDisplayDate(DateTime? date) {
    String formattedDate = "";
    if (date != null) {
      formattedDate = DateFormat("dd MMM yyyy").format(date);
      
    } 
    return formattedDate;
  }

void _settingModalBottomSheet(BuildContext context, Job item, double height) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.65, 
        child: JobModal(item: item, height: height),
      );
    },
  );
}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Container(
      color: offWhiteColor,
      padding: const EdgeInsets.only(top:5), 
      child: ListView.separated(
      itemCount: jobListings.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 0.5, 
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), 
              side: BorderSide.none, 
            ),
          margin: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
          child: ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            onTap: () {
              _settingModalBottomSheet(
                  context, jobListings[index], screenHeight);
            },
            
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  jobListings[index].company.toUpperCase(),
                  style: const TextStyle(
                      color: orangeColor,
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  formatDisplayDate(jobListings[index].listingDate),
                  style: const TextStyle(color: greyColor, fontSize: 12),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 5),
                  child: Text(
                    jobListings[index].title,
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
                        "${jobListings[index].salaryRange}/month",
                        style: const TextStyle(
                          color: darkGreyColor,
                          fontSize: 14
                        )),
                    const SizedBox(width:15),
                    Text(
                      jobListings[index].location,
                      style: const TextStyle(color: darkGreyColor,fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    )));
  }
}