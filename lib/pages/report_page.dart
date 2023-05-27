import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elakscam_frontend/services/page_service.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Consumer<PageService>(builder: (context, pageService, child) {
        return Text(pageService.data);
      }),
    ]);
  }
}
