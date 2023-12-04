import 'package:job_box/data/job.dart';
import 'package:job_box/data/user.dart';

const String firstName = "Mark";

final List<Job> jobs = [
    Job(
      id: 5,
      company: 'Slack',
      title: 'Senior Product Designer',
      salaryRange: '\$6k-\$8k',
      listingDate: DateTime(2020,9,9),
      location: 'East, Singapore',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/slack.svg"
    ),
    Job(
      id: 4,
      company: 'Crypto.com',
      title: 'Front-End Developer',
      salaryRange: '\$5k-\$6k',
      listingDate: DateTime(2020,9,9),
      location: 'Central, Singapore',
       description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/crypto.svg"
    ),
    Job(
      id: 3,
      company: 'Amazon',
      title: 'Product Owner',
      salaryRange: '\$8k-\$10k',
      listingDate: DateTime(2020,9,7),
      location: 'West, Singapore',
       description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/amazon.svg"
    ),
    Job(
      id: 2,
      company: 'Asana',
      title: 'Business Analyst',
      salaryRange: '\$7k-\$8k',
      listingDate: DateTime(2020,9,6),
      location: 'North-East, Singapore',
       description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/asana.svg"
    ),
    Job(
      id: 1,
      company: 'Google',
      title: 'Senior Product Designer',
      salaryRange: '\$5k-\$6k',
      listingDate: DateTime(2020,9,6),
      location: 'Central, Singapore',
       description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/google.svg"
    ),
  ];

  final List<Job> applied = [
    Job(
      id: 5,
      company: 'Slack',
      title: 'Senior Product Designer',
      salaryRange: '\$6k-\$8k',
      listingDate: DateTime(2020,9,9),
      location: 'East, Singapore',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/slack.svg"
    ),
    Job(
      id: 3,
      company: 'Amazon',
      title: 'Product Owner',
      salaryRange: '\$8k-\$10k',
      listingDate: DateTime(2020,9,7),
      location: 'West, Singapore',
       description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      requirement: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      logo: "assets/images/amazon.svg"
    ),
  ];

  final List<User> users = [
    User(
    firstName: "Adrian",
    lastName: "Severin",
    email: "Adrianseverin@gmail.com",
    mobileNumber: "+6594717281",
    skills: ["Figma"],
    resumeList: [
      Resume(
          name: "My Resume.pdf",
          fileLocation: "documents/pdf/sample.pdf",
          uploadDate: DateTime(2020,11,6))
    ],
    coverList: [
      CoverLetter(
          name: "My Cover letter final.doc",
          fileLocation: "documents/pdf/dummy.pdf",
          uploadDate: DateTime(2020,11,6)),
           CoverLetter(
          name: "My Cover letter.doc",
          fileLocation: "documents/pdf/dummy1.pdf",
          uploadDate: DateTime(2020,11,6))
    ],
    appliedList: [1, 3],
    image: "assets/images/person.jpg",
  ),
  ];