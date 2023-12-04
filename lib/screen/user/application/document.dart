import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:job_box/data/user.dart';
import 'package:job_box/util/color.dart';

import 'package:job_box/screen/user/application/apply.dart';

class Document extends StatefulWidget {
  Document(
      {super.key,
      required this.height,
      required this.width,
      required this.nextPage,
      required this.profile,
      required this.selectedCoverLetter,
      required this.selectedResume});

  final double height;
  final double width;
  final Function nextPage;
  final User profile;
  int selectedResume, selectedCoverLetter;

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  List<String> resumeList = [];
  List<String> coverLetterList = [];

  String formatDisplayDate(DateTime? date) {
    String formattedDate = "";
    if (date != null) {
      formattedDate = DateFormat("dd/MM/yy").format(date).toString();
    } 
    return formattedDate;
  }

  var attachment, input;

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
              title: const Text("Resume",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              subtitle:
                  const Text("Remember to include your most updated resume"),
              trailing: InkWell(
                  onTap: () {
                   
                  },
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.black,
                    weight: 700,
                  )),
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemCount: (widget.profile.resumeList).length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: ((context, index) {
                  return ListTile(
                   
                    title: Text(
                      widget.profile.resumeList[index].name,
                      style: TextStyle(
                          color: selectedResume == index
                              ? Colors.white
                              : orangeColor),
                    ),
                    subtitle: Text(
                      formatDisplayDate(
                        widget.profile.resumeList[index].uploadDate,
                      ),
                      style: TextStyle(
                          color: selectedResume == index
                              ? Colors.white
                              : orangeColor),
                    ),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 1, color: orangeColor)),
                    tileColor: selectedResume == index
                        ? orangeColor
                        : yellowColor,
                    leading: SizedBox(
                        height: double.infinity,
                        child:  Transform.rotate(
  angle: 3.14 * 1.5, 
  child:Icon(
                          Icons.note,
                          color: selectedResume == index
                              ? Colors.white
                              : orangeColor,
                        ))),
                    onTap: () {
                    
                    },
                  );
                })),
            SizedBox(
              height: widget.height * 0.02,
            ),
            ListTile(
              contentPadding:EdgeInsets.zero,
              title: const Text("Cover Letter",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              subtitle: const Text("Stand out with your cover letter"),
              trailing: InkWell(
                  onTap: () {
                   
                  },
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.black,
                    weight: 700,
                  )),
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemCount: (widget.profile.coverList).length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: ((context, index) {
                  return ListTile(
                    
                    title: Text(
                      widget.profile.coverList[index].name,
                      style: TextStyle(
                          color: selectedCoverLetter == index
                              ? Colors.white
                              : orangeColor),
                    ),
                    subtitle: Text(
                      formatDisplayDate(
                        widget.profile.coverList[index].uploadDate,
                      ),
                      style: TextStyle(
                          color: selectedCoverLetter == index
                              ? Colors.white
                              : orangeColor),
                    ),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(width: 1, color: selectedCoverLetter == index ? orangeColor : peachColor)),
                    tileColor: selectedCoverLetter == index
                        ? orangeColor
                        : yellowColor,
                    leading: SizedBox(
                        height: double.infinity,
                        child: Transform.rotate(
  angle: 3.14 * 1.5,  
  child:Icon(
                          Icons.note,
                          color: selectedCoverLetter == index
                              ? Colors.white
                              : orangeColor,
                        ))),
                    onTap: () {
                     
                    },
                  );
                })),
                             SizedBox(
                  height: widget.height * 0.02,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 16.0),
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
