import 'dart:convert';

import 'package:elakscam_frontend/configs/host.dart';
import 'package:elakscam_frontend/models/accountDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elakscam_frontend/services/page_service.dart';
import 'package:elakscam_frontend/models/category.dart';
import 'package:http/http.dart' as http;

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final accountController = TextEditingController();
  final categoryController = TextEditingController();
  final evidenceController = TextEditingController();
  final evidenceDesController = TextEditingController();

  Future<AccountDetail> createReport(String account, String category,
      String? evidence, String? evidenceDesc) async {
    Map<String, String> reportMapping = {
      'account': account,
      'category': category
    };

    if (evidence != null && evidence.isNotEmpty) {
      reportMapping['evidence'] = evidence;
    }

    if (evidenceDesc != null && evidenceDesc.isNotEmpty) {
      reportMapping['evidenceDes'] = evidenceDesc;
    }

    final response = await http.post(
      Uri.parse('${baseUrl}api/reports/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Token 7a1815f0ff33391aca6177d3d6f62cdcc69d8b62f1ba86d9c4008bbd81759f1a'
      },
      body: jsonEncode(reportMapping),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return AccountDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<Categories>> categoryEntries =
        <DropdownMenuEntry<Categories>>[];
    for (final Categories category in Categories.values) {
      categoryEntries.add(
        DropdownMenuEntry<Categories>(value: category, label: category.label),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Consumer<PageService>(builder: (context, pageService, child) {
        accountController.text = pageService.data;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: accountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<Categories>(
                initialSelection: Categories.business,
                controller: categoryController,
                label: const Text('Category'),
                dropdownMenuEntries: categoryEntries,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: evidenceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Evidence',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: evidenceDesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Evidence Description',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String accountNumber = accountController.text;
                String category = categoryController.text;
                String evidence = evidenceController.text;
                String evidenceDes = evidenceDesController.text;
                createReport(accountNumber, category, evidence, evidenceDes);
              },
              child: const Text('Submit Report'),
            )
          ],
        );
      }),
    );
  }
}
