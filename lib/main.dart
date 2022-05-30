import 'package:flutter/material.dart';
import 'package:qyre_test/ui/availability_page/availability_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AvailabilityPage(),
    );
  }
}
