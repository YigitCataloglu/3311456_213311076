import 'package:flutter/material.dart';


class HesaplarSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white38,

        title: Text('Banka Hesaplarım',style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          hesaplar(
            hesapAdi: 'Vadesiz Hesap',
            subeAdi: 'Merkez Şube',
            hBakiye: '10.000 TL',
            hspdetay: HesapDetay(
              ad: 'Yigit Cataloglu',
              sube: 'Merkez Şubesi (Ankara)',
              musteriNo: '123456',
              iban: 'TR12 3456 7890 1234 5678',
              hesapAcilis: '01.02.2023',
              hesapTuru: 'TL',
              bakiye: '10.000 TL',
            ),
          ),
          hesaplar(
            hesapAdi: 'Döviz Hesabı',
            subeAdi: 'Merkez Şube',
            hBakiye: '2.500 EUR',
            hspdetay: HesapDetay(
              ad: 'Yigit Cataloglu',
              sube: 'Merkez Şubesi (Ankara)',
              musteriNo: '123456',
              iban: 'TR98 7654 3210 9876 5432',
              hesapAcilis: '11.02.2023',
              hesapTuru: 'EUR',
              bakiye: '2.500 EUR',
            ),
          ),
          hesaplar(
            hesapAdi: 'Yatırım Hesabı',
            subeAdi: 'Merkez Şube',
            hBakiye: '50.000 TL',
            hspdetay: HesapDetay(
              ad: 'Yigit Cataloglu',
              sube: 'Merkez Şubesi (Ankara)',
              musteriNo: '123456',
              iban: 'Bulunmamaktadır',
              hesapAcilis: '11.04.2023',
              hesapTuru: 'TL',
              bakiye: '50.000',
            ),
          ),
        ],
      ),
    );
  }
}

class hesaplar extends StatelessWidget {
  final String hesapAdi;
  final String subeAdi;
  final String hBakiye;
  final HesapDetay hspdetay;

  const hesaplar({
    required this.hesapAdi,
    required this.subeAdi,
    required this.hBakiye,
    required this.hspdetay,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
            hesapDetay(context);
          },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                hesapAdi,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                subeAdi,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Bakiye: $hBakiye',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hesapDetay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(hesapAdi),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              hesapDetaylari('Ad Soyad:', hspdetay.ad),
              hesapDetaylari('Şube Adı:', hspdetay.sube),
              hesapDetaylari('Müşteri Numarası:', hspdetay.musteriNo),
              hesapDetaylari('IBAN:', hspdetay.iban),
              hesapDetaylari('Hesap Açılış Tarihi:', hspdetay.hesapAcilis),
              hesapDetaylari('Hesap Türü:', hspdetay.hesapTuru),
              hesapDetaylari('Bakiye:', hspdetay.bakiye),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget hesapDetaylari(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8.0),
          Text(value),
        ],
      ),
    );
  }
}

class HesapDetay {
  final String ad;
  final String sube;
  final String musteriNo;
  final String iban;
  final String hesapAcilis;
  final String hesapTuru;
  final String bakiye;

  HesapDetay({
    required this.ad,
    required this.sube,
    required this.musteriNo,
    required this.iban,
    required this.hesapAcilis,
    required this.hesapTuru,
    required this.bakiye,
  });
}
