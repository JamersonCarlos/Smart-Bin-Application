import 'package:flutter/material.dart';
import 'package:smart_bin/pages/Details_Bin.dart';
import 'package:smart_bin/services/api_service.dart';

class ListBins extends StatefulWidget {
  const ListBins({super.key});

  @override
  State<ListBins> createState() => _ListBinsState();
}

class _ListBinsState extends State<ListBins> {
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getAllBins(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<dynamic>? bins = snapshot.data;
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 1), () {
                setState(() {});
              });
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 230,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: bins!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailsBin(
                          bin: bins[index],
                        );
                      },
                    ));
                  },
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'lixeira ${bins[index]['identidade']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/img/bin.png',
                                width: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  width: 58,
                                  height: 65 *
                                      double.parse((bins[index]['altura_lixo'] /
                                              bins[index]['altura_cm'])
                                          .toString()),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF775F19),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.grey,
          ));
        }
      },
    );
  }
}
