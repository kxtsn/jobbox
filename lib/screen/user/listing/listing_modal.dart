import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/data/job.dart';
import 'package:job_box/util/color.dart';

import 'package:job_box/screen/user/application/apply.dart';

class JobModal extends StatefulWidget {
  final Job item;
  final double height;

  const JobModal(
      {super.key, required this.item, required this.height});

  @override
  State<JobModal> createState() => _JobModalState();
}

class _JobModalState extends State<JobModal> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(widget.item.logo, width: 85, height: 85),
                        SizedBox(height: widget.height * 0.02),
                        Text(
                          widget.item.company.toUpperCase(),
                          style: const TextStyle(color: orangeColor, fontWeight: FontWeight.w600,fontSize:18),
                        ),
                        SizedBox(
                          height: widget.height * 0.01,
                        ),
                        Text(
                          widget.item.title,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: widget.height * 0.01,
                        ),
                        Text(
                          widget.item.location,
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: widget.height * 0.02,
                  ),
                  const Text(
                    "Job Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:18),
                  ),
                  SizedBox(
                    height: widget.height * 0.01,
                  ),
                  Text(
                    widget.item.description,
                    style: const TextStyle(wordSpacing: 5, height: 1.5, fontSize:18),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: widget.height * 0.03,
                  ),
                  const Text(
                    "Requirements",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:18),
                  ),
                  SizedBox(
                    height: widget.height * 0.01,
                  ),
                  Text(
                    widget.item.requirement,
                    style: const TextStyle(wordSpacing: 5, height: 1.5, fontSize:18),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          BottomAppBar(
            padding: const EdgeInsets.all(5),
             elevation: 0.0,
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                     height: 50, 
                    child: ElevatedButton(
                      style:  ElevatedButton.styleFrom(
                                     shape: RoundedRectangleBorder(
                                      
                        borderRadius: BorderRadius.circular(8.0), 
                      ),
                                  backgroundColor: lightOrangeColor,
                                ),
                      child: Text(
                        "Apply This Job",
                         style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                      ),
                      onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Application(job: widget.item)),
                      );
                   
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color.fromARGB(255, 238, 230, 219)),
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      color: orangeColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}