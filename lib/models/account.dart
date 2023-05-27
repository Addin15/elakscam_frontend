class Account {
  final int score;
  final String account;

  const Account({required this.score, required this.account});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(account: json['account']['number'], score: json['score']);
  }
}
