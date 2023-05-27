class AccountDetail {
  final String id;
  final String account_number;
  final String category;
  final String evidence;
  final String evidence_description;
  final String reporterID;
  final String reporterFname;
  final String reporterLname;
  final String reporterEmail;
  final String dateTime;

  const AccountDetail(
      {required this.id,
      required this.account_number,
      required this.category,
      required this.evidence,
      required this.evidence_description,
      required this.reporterID,
      required this.reporterFname,
      required this.reporterLname,
      required this.reporterEmail,
      required this.dateTime});

  factory AccountDetail.fromJson(Map<String, dynamic> json) {
    return AccountDetail(
        id: json['account']['number'],
        account_number: json['score'],
        category: json['category'],
        evidence: json['evidence'],
        evidence_description: json['evidence_description'],
        reporterID: json['reported_by']['id'],
        reporterFname: json['reported_by']['first_name'],
        reporterLname: json['reported_by']['last_name'],
        reporterEmail: json['reported_by']['email'],
        dateTime: json['dateTime']);
  }
}
