import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_box/util/color.dart';

import 'package:job_box/util/data.dart' as data;
import 'package:job_box/data/job.dart';

import 'document.dart';
import 'employment.dart';
import 'review.dart';

class Application extends StatefulWidget {
  const Application({super.key, required this.job});

  final Job job;

  @override
  State<Application> createState() => _ApplicationState();
}

double _progress = 0;
int currentPage = 0;
final PageController _progressController = PageController(initialPage: 0);

String school = "";
String study = "";
String year = "";

int selectedResume = 0;
int selectedCoverLetter = 0;

bool educationSwitch = false;
bool experienceSwitch = true;

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    _progress = 1 / 3;
  }

  String returnProgressTitle() {
    String title = "";
    if (_progress == 1 / 3) {
      title = "Uploading of Documents";
    } else if (_progress == 2 / 3) {
      title = "Employment Information";
    } else {
      title = "Review Information";
    }
    return title;
  }

  void nextPage() {
    setState(() {
      currentPage = currentPage + 1;
      _progress = (currentPage + 1) / 3;
    });
    _progressController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void previousPage() {
    _progressController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {
      currentPage = currentPage - 1;
      _progress = (currentPage - 1) / 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _progress != 1 / 3
            ? IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  previousPage();
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
            minimum: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apply to ${widget.job.company}",
                  style: GoogleFonts.autourOne(
          textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Text(
                  returnProgressTitle(),
                  style: const TextStyle(color: orangeColor, fontSize: 16),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),  
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child:LinearProgressIndicator(
                    minHeight: 5.0,
                    value: _progress,
                    color: orangeColor,
                    backgroundColor: peachColor.withOpacity(0.5))),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Expanded(
                  child: PageView(
                    controller: _progressController,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                        _progress = (currentPage + 1) /
                            3;
                      });
                    },
                    children: [
                        Document(
                        height: screenHeight,
                        width: screenWidth,
                        nextPage: nextPage,
                        profile: data.users[0],
                        selectedResume: selectedResume,
                        selectedCoverLetter: selectedCoverLetter,
                      ),
                        Employment(
                        height: screenHeight,
                        width: screenWidth,
                        nextPage: nextPage,
                        school: school,
                        study: study,
                        year: year,
                        experienceSwitch: experienceSwitch,
                        educationSwitch: educationSwitch,
                      ),
                      Review(
                        height: screenHeight,
                        width: screenWidth,
                        nextPage: nextPage,
                        profile: data.users[0],
                        selectedResume: selectedResume,
                        selectedCoverLetter: selectedCoverLetter,
                        id: widget.job.id.toString(),
                        school: school,
                        course: study,
                        year: year,
                        experience: experienceSwitch,
                        education: educationSwitch,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}