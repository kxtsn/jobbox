class User {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  List<String> skills;
  List<Resume> resumeList;
  List<CoverLetter> coverList;
  List<int> appliedList;
  dynamic image;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.skills,
    required this.resumeList,
    required this.coverList,
    required this.appliedList,
    required this.image,
  });
}

class Resume {
  String name;
  String fileLocation;
  DateTime uploadDate;

  Resume(
      {required this.name,
      required this.fileLocation,
      required this.uploadDate});
}

class CoverLetter {
  String name;
  String fileLocation;
  DateTime uploadDate;

  CoverLetter(
      {required this.name,
      required this.fileLocation,
      required this.uploadDate});
}



