import 'package:flutter/cupertino.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('amir'),);
  }
}
