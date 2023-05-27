import 'dart:convert';

import 'package:elakscam_frontend/configs/host.dart';
import 'package:elakscam_frontend/models/account.dart';
import 'package:http/http.dart';

class CheckAPI {
  checkAccount(String account) async {
    String url = '${baseUrl}api/validate/$account';

    Response response = await get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return Account.fromMap(
        jsonDecode(response.body),
      );
    }
  }
}
