import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:job_box/util/color.dart';
import 'package:job_box/util/data.dart' as data;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String formatDisplayDate(DateTime? date) {
    String formattedDate = "";
    if (date != null) {
      formattedDate = DateFormat("dd/MM/yy").format(date).toString();
    } 
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      minimum: const EdgeInsets.all(10),
      child: Container(
      color: offWhiteColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left:10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children: [
                    Text(
                      "Your Profile ",
                      style: GoogleFonts.autourOne(
          textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )
                    ),
                    const Icon(
                      Icons.person,
                      size: 25,
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                ),
              Center(child:  Stack(
  alignment: Alignment.bottomRight,
  children: [
   
    CircleAvatar(
      maxRadius: 50,
      backgroundImage: AssetImage(
        data.users[0].image,
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: brownColor, 
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    ),
  ],),
),
                  SizedBox(
                  height: screenHeight * 0.04,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contact Info",
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                    Icon(
                      Icons.edit,
                      color: brownColor,
                      size: 30
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                  "Full Name",
                  style: TextStyle(color: darkGreyColor, fontSize: 16),
                ),
                  SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text("${ data.users[0].firstName} ${ data.users[0].lastName}",style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  "Email",
                 style: TextStyle(color: darkGreyColor, fontSize: 16),
                ),
                  SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text( data.users[0].email,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  "Mobile Number",
                 style: TextStyle(color: darkGreyColor, fontSize: 16),
                ),
                  SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text("${ data.users[0].mobileNumber} ",style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Divider(),
                SizedBox(
                  height: screenHeight * 0.02,
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
                  height: screenHeight * 0.02,
                ),
                const Text(
                  "Resume",
                 style: TextStyle(color: darkGreyColor, fontSize: 16),
                ),
                ListTile(
                   contentPadding: EdgeInsets.zero,
                  title: Text(
                     data.users[0].resumeList[0].name,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                  subtitle: Text(
                    formatDisplayDate(
                       data.users[0].resumeList[0].uploadDate,
                    ),
                  ),
                  leading:  SizedBox(
                      height: double.infinity,
                      child: Transform.rotate(
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
                     data.users[0].coverList[0].name,style: const TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                  subtitle: Text(
                    formatDisplayDate(
                       data.users[0].coverList[0].uploadDate,
                    ),
                  ),
                  leading:  SizedBox(
                      height: double.infinity,
                      child:  Transform.rotate(
  angle: 3.14 * 1.5, 
  child:const Icon(Icons.note, color: brownColor, size:30))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}