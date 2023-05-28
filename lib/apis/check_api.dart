import 'dart:convert';

import 'package:elakscam_frontend/configs/host.dart';
import 'package:elakscam_frontend/models/account.dart';
import 'package:http/http.dart';

class CheckAPI {
  static Future<Account> checkAccount(String account) async {
    String url = '$baseUrl/api/validate/$account';

    Response response = await get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return Account.fromMap(
        jsonDecode(response.body),
      );
    }

    return Account(
      accountNumber: account,
      holderName: null,
      appealed: null,
      score: null,
      totalReports: 0,
    );
  }
}
