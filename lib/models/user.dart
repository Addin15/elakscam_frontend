class XUser {
  int? id;
  String? firstName;
  String? lastName;
  String? email;

  XUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory XUser.fromMap(Map<String, dynamic> data) => XUser(
        id: data['id'],
        firstName: data['first_name'],
        lastName: data['last_name'],
        email: data['email'],
      );

  toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      };
}
