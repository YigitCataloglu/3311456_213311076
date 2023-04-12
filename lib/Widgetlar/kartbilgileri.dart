import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'karttasarim.dart';

class KartBilgileri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(175, 224, 200, 102),
                  Color.fromARGB(255, 223, 200, 227)
                ], // color koyma limiti yok
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          height: 850,
          child: Padding(
            padding: EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 8),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  KartTasarim(
                    renk: Color.fromARGB(255, 20, 15, 113),
                    yazirenk: Color.fromARGB(255, 255, 255, 255),
                    genislik: 300,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  KartDetaylari(
                  
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 30,
                    width: 200,
                    child: ElevatedButton(
                        child: Text('Geri Dön'),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 20, 15, 113), 
                          onPrimary: Colors.white, 
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), 
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class KartDetaylari extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[   
           Container(
            width: 358,
            child: ExpansionTileCard(
              title: Text('Kart Bilgileri'),
              trailing: Icon(
                Icons.arrow_drop_down_outlined,
                color: Color.fromARGB(255, 19, 48, 193),
              ),
              initialElevation: 15,
              expandedColor: Colors.white,
              children: [
                Card(
                  child: ListTile(
                    title: Text('''KART NO: 5435 0566 0214 1234

Kullanilabilir Bakiye:  7835₺

IBAN  1245 5432 4327 8743 3478 4090

CVV:   915

SON KULLANMA TARİHİ:  12/24'''),

                  ),
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
