import 'dart:convert';
import 'dart:io';

import 'package:elakscam_frontend/configs/host.dart';
import 'package:elakscam_frontend/models/report.dart';
import 'package:http/http.dart';

class ReportAPI {
  static Future<List<Report>> getReports() async {
    String url = '${baseUrl}api/reports/';

    Response response = await get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Report.fromMap(e)).toList();
    }

    return [];
  }

  static Future<Report?> createReport({
    required String number,
    required String category,
    File? evidence,
    String? evidenceDescription,
  }) async {
    String url = '${baseUrl}api/reports/';

    var request = MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'account_number': number,
      'category': category,
    });

    if (evidence != null) {
      request.files
          .add(await MultipartFile.fromPath('evidence', evidence.path));
    }

    Response response = await Response.fromStream(await request.send());

    if (response.statusCode == 201) {
      return Report.fromMap(jsonDecode(response.body));
    }

    return null;
  }
}
