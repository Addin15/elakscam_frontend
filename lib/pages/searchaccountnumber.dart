import 'package:flutter/material.dart';

class SearchAccountNumber extends StatefulWidget {
  const SearchAccountNumber({super.key});

  @override
  State<SearchAccountNumber> createState() => _SearchAccountNumberState();
}

class _SearchAccountNumberState extends State<SearchAccountNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'true');
          },
          child: const Text('Search Account Number'),
        ),
      ),
    );
  }
}
