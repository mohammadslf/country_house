import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AllCountries(),
  ));
}

class AllCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Countries"),
      ),
    );
  }
}
