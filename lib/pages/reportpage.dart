import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  final Function changePage;
  const ReportPage({super.key, required this.changePage});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Search Account Number'),
        ),
      ),
    );
  }
}
