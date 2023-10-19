
import 'package:flutter/material.dart';

class FormBin extends StatefulWidget {
  const FormBin({super.key});

  @override
  State<FormBin> createState() => _FormBinState();
}

class _FormBinState extends State<FormBin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/smart_bin.png',
          height: 65,
        ),
        elevation: 2,
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: const Color(0xFF1A7DA1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      ),
    );
  }
}
