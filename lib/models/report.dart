import 'package:elakscam_frontend/models/user.dart';

class Report {
  String? id;
  String? accountNumber;
  String? category;
  String? evidence;
  String? evidenceDescription;
  XUser? reportedBy;
  DateTime? dateTime;

  Report({
    required this.id,
    required this.accountNumber,
    required this.category,
    required this.evidence,
    required this.evidenceDescription,
    required this.reportedBy,
    required this.dateTime,
  });

  factory Report.fromMap(Map<String, dynamic> data) => Report(
        id: data['id'],
        accountNumber: data['account_number'],
        category: data['category'],
        evidence: data['evidence'],
        evidenceDescription: data['evidence_description'],
        reportedBy: XUser.fromMap(data['reported_by']),
        dateTime: DateTime.parse(data['datetime']),
      );
}
