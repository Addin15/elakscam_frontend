import 'package:elakscam_frontend/pages/qrcodescanner.dart';
import 'package:elakscam_frontend/pages/searchaccountnumber.dart';
import 'package:elakscam_frontend/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

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
        Consumer<PageService>(builder: (context, pageService, child) {
          return ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchAccountNumber(),
                ),
              );

              result == 'true' ? pageService.changePage(2) : '';
            },
            child: const Text('Search Account Number'),
          );
        }),
      ],
    );
  }
}
