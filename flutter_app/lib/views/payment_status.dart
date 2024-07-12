import 'package:flutter/material.dart';

class PaymentStatusPage extends StatefulWidget {
  @override
  _PaymentStatusPageState createState() => _PaymentStatusPageState();
}

class _PaymentStatusPageState extends State<PaymentStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Status'),
      ),
      body: Center(
        child: Text('Payment Status Page'),
      ),
    );
  }
}
