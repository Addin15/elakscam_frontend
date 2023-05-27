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
  String qrValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QrCodeScanner(screenClosed: false),
              ),
            );
            result != ''
                ? setState(() {
                    qrValue = result;
                  })
                : '';
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

              if (result[0] == 'true') {
                pageService.changePage(2);
                pageService.setData1(result);
              }
            },
            child: const Text('Search Account Number'),
          );
        }),
      ],
    );
  }
}
