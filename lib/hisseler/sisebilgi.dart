import 'package:flutter/material.dart';

import 'hisselistesi.dart';

class sise extends StatefulWidget {
  @override
  State<sise> createState() => _siseState();
}

class _siseState extends State<sise> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/sisecam_yatay_logo.png'),
        ),
        body: SafeArea(
          child: TanitimWidgetim(),
          
        ),
      ),
    );
  }
}

class TanitimWidgetim extends StatelessWidget {
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
                '''Atatürk’ün direktifleriyle 1935 yılında Türkiye İş Bankası tarafından kurulan Şişecam,85 yılı  aşan geçmişiyle Türkiye’nin en köklü sanayi kuruluşlarından biri olmanın yanısıra 
ihtisaslaşma derecesi ve rekabet gücü yüksek faaliyetleriyle dünyanın en seçkin üreticileri arasında yer almaktadır. 
Ülkemiz​in temel cam ürünleri gereksinimini karşılamak üzere kurulan Şişecam, 
günümüzde Türkiye’nin en güçlü sanayi kuruluşlarından biri olmanın ötesinde,
camın tüm temel alanları ile soda ve krom bileşiklerini kapsayan iş kollarında küresel bir oyun kurucuya dönüşmüştür.''',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(height: 10,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '''

Borsa islem kodu: SISE
Sermaye: 3.063.214.056
Piyasa Değeri:132.269.582.945,42 ₺
06.04.2023 tarihindeki güncel değeri: 43.18₺''',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
                height: 300,
                width: 200,
                child: PageView(children: [
                  Image.asset('assets/images/sisecam1.jpg'),
                  Image.asset('assets/images/sisecam2.jpg'),
                  Image.asset('assets/images/sisecam3.jpg'),
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
