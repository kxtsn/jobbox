class Job {
  final int id;
  final String company;
  final String title;
  final String salaryRange;
  final DateTime listingDate;
  final String location;
  final String description;
  final String requirement;
  dynamic logo;

  Job({
    required this.id,
    required this.company,
    required this.title,
    required this.salaryRange,
    required this.listingDate,
    required this.location,
    required this.description,
    required this.requirement,
    this.logo
  });
}
