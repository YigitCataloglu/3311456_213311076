import 'package:flutter/material.dart';

import 'hisselistesi.dart';

class froto extends StatefulWidget {
  @override
  State<froto> createState() => _frotoState();
}

class _frotoState extends State<froto> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/fordotosan.png'),
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
                '''Ford Otosan, 1959 yılında Vehbi Koç tarafından Acıbadem, Üsküdar'da kurulmuş Türk otomotiv şirketidir.

1997 yılında Koç Holding ve Ford hisselerinin eşitlenmesiyle Ford Otosan kurulmuştur. 1966-1984 yılları arasında Anadol marka araçları üreten Otosan, ilerleyen yıllarda Ford'un Taunus, Escort, Transit, Connect ve Courier modellerini üretmiştir. Ford Otosan bünyesinde İhsaniye Merkez, Gölcük, Yeniköy Merkez, Başiskele, Kocaeli ve İnönü, Eskişehir Fabrikaları, Cevizli, Kartal Yedek parça Merkezi ve Akpınar, Sancaktepe AR-GE Merkezi'nde toplamda 10.000 üzerinde kişi çalışmaktadır. Ford Otosan araç ihracatının yanı sıra son 5 senedir 320 milyon doların üzerinde mühendislik ihracatı yapmıştır. ''',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(height: 10,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.only(right: 8,left: 8),
              child: Text(
                  '''

Borsa islem kodu: FROTO
Sermaye: 350.910.000
Piyasa Değeri:213.704.190.000,00 ₺
06.04.2023 tarihindeki güncel değeri: 609,00₺''',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
                height: 300,
                width: 200,
                child: PageView(children: [
                  Image.asset('assets/images/ford4.png'),
                  Image.asset('assets/images/ford3.jpg'),
                  Image.asset('assets/images/ford5.jpg'),
                  Image.asset('assets/images/ford1.jpg'),
                  Image.asset('assets/images/ford2.jpg'),
                ])),
            ElevatedButton(
                child: Text(
                    'Hisse Listesi'), // class ismi olacak burada o sayfaya yönlendirir
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
