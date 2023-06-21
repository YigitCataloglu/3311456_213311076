import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class canliBorsa extends StatefulWidget {
  @override
  _canliBorsaState createState() => _canliBorsaState();
}

class _canliBorsaState extends State<canliBorsa> {
  List<Hisse> hisseler = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[350],
        title: Text('BİST 30',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.black),),
        
      ),
      body: Column(
        children: [
          
          Padding(
            padding: EdgeInsets.only(left:2.0,right: 2.0,top: 8.0),
            child: Card(
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Hisse Adı',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '     Son Fiyat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '  %Fark  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hisseler.length,
              itemBuilder: (context, index) {
                var hisse = hisseler[index];
                return Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hisse.isim,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height:4),
                              Text(
                                '${hisse.zaman}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8,),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '${hisse.fiyat.toStringAsFixed(2)} ₺',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${hisse.degisim.toStringAsFixed(2)}%',
                            style: TextStyle(
                              color: hisse.degisim > 0 ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    hisseleriGetir();
  },
  label: Text(
    'Yenile',
    style: TextStyle(
      fontSize: 16,
    ),
  ),
  icon: Icon(Icons.refresh),
  backgroundColor: Color.fromARGB(255, 112, 112, 112).withOpacity(0.5),
),

    );
  }

  @override
  void initState() {
    super.initState();
    hisseleriGetir();
  }

  Future<void> hisseleriGetir() async {
    var url = Uri.parse('https://api.collectapi.com/economy/liveBorsa');
    var headers = {
      'content-type': 'application/json',
      'authorization': 'apikey 1XElDvGIgmt2UE3MvmzV9p:6OCZbNH1a064S5L2vmIdYI',
    };

    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var sonuclar = jsonData['result'];

        List<Hisse> guncellenenHisseler = [];

        var istenenHisseler = [
          'SISE',
          'TOASO',
          'FROTO',
          'BIMAS',
          'ASELS',
          'AKSA',
          'EREGL',
          'SASA',
          'AKBNK',
          'AKSEN',
          'ALARK',
          'ARCLK',
          'EKGYO',
          'ENKAI',
          'GARAN',
          'GUBRF',
          'HEKTS',
          'ISCTR',
          'KCHOL',
          'KOZAA',
          'KOZAL',
          'KRDMD',
          'ODAS',
          'PETKM',
          'PGSUS',
          'ASHOL',
          'TAVHL',
          'TCELL',
          'THYAO',
          'TUPRS',
          'YKBNK',

        ];

        for (var hisseVerisi in sonuclar) {
          var isim = hisseVerisi['name'];
          var fiyat = double.parse(hisseVerisi['price'].toString());
          var degisim = double.parse(hisseVerisi['rate'].toString());
          var zaman = hisseVerisi['time'];

          if (istenenHisseler.contains(isim)) {
            var hisse = Hisse(
              isim: isim,
              fiyat: fiyat,
              degisim: degisim,
              zaman: zaman,
            );
            guncellenenHisseler.add(hisse);
          }
        }

        setState(() {
          hisseler = guncellenenHisseler;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veriler alınamadı. Hata: ${response.statusCode}'),
          ),
        );
      }
    } catch (hata) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bir hata oluştu: $hata'),
        ),
      );
    }
  }
}

class Hisse {
  final String isim;
  final double fiyat;
  final double degisim;
  final String zaman;

  Hisse({
    required this.isim,
    required this.fiyat,
    required this.degisim,
    required this.zaman,
  });
}
