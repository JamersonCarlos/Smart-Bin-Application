import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_bin/pages/Details_Bin.dart';
import 'package:smart_bin/pages/FormBin.dart';
import 'package:smart_bin/services/notification_service.dart';
import 'package:smart_bin/widgets/listBins.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = new NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.initialize();
  }

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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        child: Column(
          children: [
            const Expanded(child: ListBins()),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const FormBin();
                        },
                      ));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF1A7DA1),
                    ),
                    child: const Text(
                      'Adicionar lixeira',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
