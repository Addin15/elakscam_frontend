import 'package:elakscam_frontend/pages/qrcodescanner.dart';
import 'package:elakscam_frontend/pages/searchaccountnumber.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Function(int index) changePage;
  const SearchPage({super.key, required this.changePage});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QrCodeScanner(),
              ),
            );
          },
          child: const Text('Scan QR'),
        ),
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SearchAccountNumber(),
              ),
            );
            result == 'true' ? widget.changePage(2) : '';
          },
          child: const Text('Search Account Number'),
        ),
      ],
    );
  }
}
