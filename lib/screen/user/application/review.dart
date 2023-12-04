import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/data/user.dart';
import 'package:job_box/util/color.dart';

import 'package:job_box/screen/user/home.dart';

class Review extends StatefulWidget {
  const Review(
      {super.key,
      required this.height,
      required this.width,
      required this.nextPage,
      required this.profile,
      required this.selectedCoverLetter,
      required this.selectedResume,
      required this.id,
      required this.school,
      required this.course,
      required this.year,
      required this.experience,
      required this.education});

  final double height;
  final double width;
  final Function nextPage;
  final User profile;
  final int selectedResume;
  final int selectedCoverLetter;

  final String id;
  final String school;
  final String course;
  final String year;
  final bool experience;
  final bool education;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  String formatDisplayDate(DateTime? date) {
    String formattedDate = "";
    if (date != null) {
      formattedDate = DateFormat("dd/MM/yy").format(date).toString();
    } 
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Contact Info",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Icon(
              Icons.edit,
                 color: brownColor,
                      size: 30
            )
          ],
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        Center(
          child: CircleAvatar(
            maxRadius: 50,
            backgroundImage: AssetImage(
              widget.profile.image,
            ),
          ),
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        const Text(
          "Full Name",
          style: TextStyle(color: darkGreyColor, fontSize: 16),
        ),
          SizedBox(
          height: widget.height * 0.01,
        ),
        Text("${widget.profile.firstName} ${widget.profile.lastName}",style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Text(
          "Email",
           style: TextStyle(color: darkGreyColor, fontSize: 16),
        ),
          SizedBox(
          height: widget.height * 0.01,
        ),
        Text(widget.profile.email,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(
          height: widget.height * 0.02,
        ),
        const Text(
          "Mobile Number",
           style: TextStyle(color: darkGreyColor, fontSize: 16),
        ),
          SizedBox(
          height: widget.height * 0.01,
        ),
        Text(widget.profile.mobileNumber,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)),
        
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Divider(),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Employment Information",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Icon(
              Icons.edit,
                 color: brownColor,
                      size: 30
            )
          ],
        ),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Text(
          "Resume",
          style: TextStyle(color: darkGreyColor, fontSize: 16),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.profile.resumeList[widget.selectedResume].name,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)
          ),
          subtitle: Text(
            formatDisplayDate(
              widget.profile.resumeList[widget.selectedResume].uploadDate,
            ),
          ),
          leading: SizedBox(
              height: double.infinity,
              child:Transform.rotate(
  angle: 3.14 * 1.5, 
  child:const Icon(Icons.note, color: brownColor, size:30))),
        ),
        const Text(
          "Cover Letter",
          style: TextStyle(color: darkGreyColor, fontSize: 16),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.profile.coverList[widget.selectedCoverLetter].name,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)
          ),
          subtitle: Text(
            formatDisplayDate(
              widget.profile.coverList[widget.selectedCoverLetter].uploadDate,
            ),
          ),
          leading:  SizedBox(
              height: double.infinity,
              child:  Transform.rotate(
  angle: 3.14 * 1.5, 
  child:const Icon(Icons.note, color: brownColor, size:30))),
        ),
        const Text(
          "Additional Skills",
          style: TextStyle(color: darkGreyColor, fontSize: 16),
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
      
              border: Border.all(), borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.all(8),
          child: Text(widget.profile.skills[0], style: const TextStyle(fontWeight: FontWeight.w600, fontSize:12),),
        ),
         SizedBox(
          height: widget.height * 0.02,
        ),
      ])),
        ),
           Container(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child:SizedBox(
            width: widget.width,
            child: SizedBox(
              width: widget.width,
              height: widget.height * 0.06,
              child:ElevatedButton(
                   style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: lightOrangeColor,
                ),
                    child:  Text(
                      "Submit",
                      style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                      ),),
                    onPressed: () async {
                       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
                    },
                  )),
          ),)
        ),
    ]);
  }
}