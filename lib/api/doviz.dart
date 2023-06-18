import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DovizListesi extends StatefulWidget {
  @override
  _DovizListesiState createState() => _DovizListesiState();
}

class _DovizListesiState extends State<DovizListesi> {
  List<Doviz> dovizler = [];
  TextEditingController adetController = TextEditingController();

  @override
  void dispose() {
    adetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: Colors.white38,
          title: Center(
            child: Text(
              '    Döviz Kurları',
              style: TextStyle(
                  fontFamily: 'Philosopher', fontSize: 30, color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
               Navigator.pop(context);
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(5.0),
        itemCount: dovizler.length,
        itemBuilder: (context, index) {
          var doviz = dovizler[index];
          return Card(
            elevation: 8,
            child: InkWell(
              onTap: () {
                _showAlisSatisEkrani(doviz);
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(doviz.name,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Alış: ${doviz.buying}'),
                        Text('Satış: ${doviz.selling}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 5.0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          dovizleriGetir();
        },
      ),
    );
  }

  void initState() {
    super.initState();
    dovizleriGetir();
  }

  Future<void> dovizleriGetir() async {
    var url = Uri.parse('https://api.collectapi.com/economy/allCurrency');
    var headers = {
      'content-type': 'application/json',
      'authorization': 'apikey 2ylq6r2bXJ2C5pFhZZynid:1u7wkR71ncBpVLxiRvgeuZ',
    };

    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var result = jsonData['result'];

        List<Doviz> guncellenenDovizler = [];

        for (var dovizVerisi in result) {
          var name = dovizVerisi['name'];
          var buying = dovizVerisi['buying'].toString();
          var selling = dovizVerisi['selling'].toString();
          if (name != null) {
            var doviz = Doviz(name: name, buying: buying, selling: selling);
            guncellenenDovizler.add(doviz);
            print(doviz.name);
            print(doviz.buying);
            print(doviz.selling);
          }
        }

        setState(() {
          dovizler = guncellenenDovizler;
        });
      } else {
        print('Hata: ${response.statusCode}');
      }
    } catch (hata) {
      print('Hata: $hata');
    }
  }

  void _showAlisSatisEkrani(Doviz doviz) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int adet = 0;
        double tutar = 0.0;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Döviz Alış/Satış'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Döviz: ${doviz.name}\n\nFiyat:${doviz.selling}'),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: adetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Adet',
                    ),
                    onChanged: (value) {
                      setState(() {
                        adet = int.tryParse(value) ?? 0;
                        tutar = adet * double.parse(doviz.selling.replaceAll(",", ""));
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text('Tutar: ${tutar.toStringAsFixed(2)}'),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Satın Al'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showUyariMesaji(adet, tutar);
                  },
                ),
                TextButton(
                  child: Text('İptal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showUyariMesaji(int adet, double tutar) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Satın Alma Tamamlandı'),
          content: Text('Alınan Dolar Miktarı: $adet\nTutar: ${tutar.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Doviz {
  var name;
  var buying;
  var selling;

  Doviz({
    required this.name,
    required this.buying,
    required this.selling,
  });
}
