class Account {
  final String? accountNumber;
  final String? holderName;
  final bool? appealed;
  final int? score;

  const Account({
    required this.accountNumber,
    required this.holderName,
    required this.appealed,
    required this.score,
  });

  factory Account.fromMap(Map<String, dynamic> data) {
    return Account(
      accountNumber: data['account']['number'],
      holderName: data['account']['holder_name'],
      appealed: data['account']['appealed'],
      score: data['score'],
    );
  }
}
