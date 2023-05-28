class Account {
  final String? accountNumber;
  final String? holderName;
  final bool? appealed;
  final double? score;
  final int totalReports;

  const Account({
    required this.accountNumber,
    required this.holderName,
    required this.appealed,
    required this.score,
    required this.totalReports,
  });

  factory Account.fromMap(Map<String, dynamic> data) {
    return Account(
      accountNumber: data['account']['number'],
      holderName: data['account']['holder_name'],
      appealed: data['account']['appealed'],
      score: double.tryParse(data['score'].toString()),
      totalReports: data['total_reports'] ?? 0,
    );
  }
}
