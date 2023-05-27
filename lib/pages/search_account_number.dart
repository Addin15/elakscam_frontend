import 'dart:convert';
import 'package:elakscam_frontend/models/Account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elakscam_frontend/services/page_service.dart';
import 'package:http/http.dart' as http;

import '../configs/host.dart';

class SearchAccountNumber extends StatefulWidget {
  const SearchAccountNumber({super.key});

  @override
  State<SearchAccountNumber> createState() => _SearchAccountNumberState();
}

class _SearchAccountNumberState extends State<SearchAccountNumber> {
  final myController = TextEditingController();
  String result = '';
  String accountState = '';

  Future<Account> fetchAccount(dataToSend) async {
    final response =
        await http.get(Uri.parse('${baseUrl}api/validate/$dataToSend/'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Account.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return const Account(score: 0, account: '404');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: myController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Account Number',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (myController.text != '') {
                setState(() {
                  result = myController.text;
                });
                var dataToSend = myController.text;
                Account account = await fetchAccount(dataToSend);
                setState(() {
                  accountState = account.account;
                });
              }
            },
            child: const Text('Search Account Number'),
          ),
          accountState != ''
              ? Consumer<PageService>(builder: (context, pageService, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      const checker = 'true';
                      var data = [checker, result];
                      Navigator.of(context).pop(data);
                    },
                    child: const Text('Report Account'),
                  );
                })
              : Container()
        ],
      )),
    );
  }
}
