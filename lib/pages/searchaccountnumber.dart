import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elakscam_frontend/services/page_service.dart';

class SearchAccountNumber extends StatefulWidget {
  const SearchAccountNumber({super.key});

  @override
  State<SearchAccountNumber> createState() => _SearchAccountNumberState();
}

class _SearchAccountNumberState extends State<SearchAccountNumber> {
  final myController = TextEditingController();
  String result = '';

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
              }
            },
            child: const Text('Search Account Number'),
          ),
          result != ''
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
