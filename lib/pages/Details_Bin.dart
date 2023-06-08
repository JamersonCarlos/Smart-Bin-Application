import 'package:flutter/material.dart';

class DetailsBin extends StatefulWidget {
  const DetailsBin({super.key, required this.bin});
  final Map<String, dynamic> bin;

  @override
  State<DetailsBin> createState() => _DetailsBinState();
}

class _DetailsBinState extends State<DetailsBin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A7DA1),
        centerTitle: true,
        title: Text(
          'Lixeira ${widget.bin['identidade']}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Setor: ${widget.bin['setor']}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'Localização: ${widget.bin['localização']}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'Capacidade: ${widget.bin['capacidade_litros']} litros',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/img/bin_g.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      width: 168,
                      height: 200 *
                          double.parse((widget.bin['altura_lixo'] /
                                  widget.bin['altura_cm'])
                              .toString()),
                      decoration: const BoxDecoration(
                        color: Color(0xFF775F19),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        ((widget.bin['altura_lixo'] / widget.bin['altura_cm']) *
                                    100)
                                .toStringAsFixed(2) +
                            '%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
