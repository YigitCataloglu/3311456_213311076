import 'package:flutter/material.dart';

import 'hisselistesi.dart';

class toaso extends StatefulWidget {
  @override
  State<toaso> createState() => _toasoState();
}

class _toasoState extends State<toaso> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/tofaslogo2.png'),
        ),
        body: SafeArea(
          child: TanitimWidgetim2(),
          
        ),
      ),
    );
  }
}

class TanitimWidgetim2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''TOFAŞ (Türk Otomobil Fabrikası A.Ş.), 1968 yılında Koç Topluluğu’nun kurucusu Vehbi Koç tarafından kuruldu. Üretim fabrikası Demirtaş, Osmangazi’de yer alan, Koç Holding ve Fiat'ın (FCA) eşit hissedar olduğu kuruluş, bugün %37,8 Fiat, %37,8 Koç Holding ve %24,3 diğer ortaklara ait ortaklık yapısıyla faaliyetlerine devam etmektedir. Tofaş, hem binek hem de hafif ticari araç üretebilen bir otomotiv şirketidir. Türk otomotiv sanayisinin büyük üreticilerinden biri olan Tofaş, yılda 450 bin araçlık üretim kapasitesine ve 10.000'den fazla çalışana sahiptir. 

2013’te Fiat Chrysler Automobiles’ın 175 fabrikasında uygulanan WCM - Dünya Klasında Üretim Programı kapsamında “Altın Seviye”ye ulaşan Tofaş’ın Bursa’daki fabrikasında, Fiat’ın yanı sıra Citroën, DS, Peugeot, Opel ve Vauxhall markaları için de üretim yapılmaktadır.''',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(height: 10,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.only(right: 8,left: 8),
              child: Text(
                  '''

Borsa islem kodu: TOASO
Sermaye: 500.000.000
Piyasa Değeri:101.500.000.000,00 ₺
06.04.2023 tarihindeki güncel değeri: 203,00₺''',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
                height: 300,
                width: 200,
                child: PageView(children: [
                  Image.asset('assets/images/tofas5.png'),
                  Image.asset('assets/images/tofas1.jpg'),
                  Image.asset('assets/images/tofas2.png'),
                  Image.asset('assets/images/tofas3.png'),
                  Image.asset('assets/images/tofas4.png'),
                ])),
            ElevatedButton(
                child: Text(
                    'Hisse Listesi'), 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Borsa()),
                  );
                }),
          ],
        ),
      ),
    ]);
  }
}
