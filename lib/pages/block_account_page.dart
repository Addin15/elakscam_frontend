import 'package:flutter/material.dart';

class BlockAccount extends StatefulWidget {
  const BlockAccount({super.key});

  @override
  State<BlockAccount> createState() => _BlockAccountState();
}

class _BlockAccountState extends State<BlockAccount> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Text('Your Reported List'),
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Ticket Scammer N'),
                subtitle: Text('Block method: Account Number'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Surau ASB QR'),
                subtitle: Text('Block method: QR Code'),
              ),
            ),
          ],
        ));
  }
}
