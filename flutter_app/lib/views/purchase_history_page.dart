import 'package:flutter/material.dart';

class PurchaseHistoryPage extends StatefulWidget {
  @override
  _PurchaseHistoryPageState createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase History'),
      ),
      body: Center(
        child: Text('Purchase History Page'),
      ),
    );
  }
}
