import 'package:flutter/material.dart';

import 'hisselistesi.dart';

class eregl extends StatefulWidget {
  @override
  State<eregl> createState() => _ereglState();
}

class _ereglState extends State<eregl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/erdemir-logo.png'),
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
                '''Erdemir, 1960'ta devlet tarafından Karadeniz Ereğli'de kurulan ve 2006'da özelleştirilerek OYAK'a devredilen demir ve çelik fabrikası. Şirket 11 Mayıs 1960 tarihinde resmen kurulmuş olup fabrika kurulması 42 ay sürmüş ve 15 Mayıs 1965'te işletmeye alınmıştır. İlk kurulduğunda kamu kuruluşu olan Erdemir, 2006 yılından itibaren Oyak Grubu bünyesinde faaliyet göstermektedir. Türkiye'nin en büyük yassı demir üreticisidir''',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(height: 10,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '''Borsa islem kodu: EREGL
Sermaye: 3.500.000.000
Piyasa Değeri:121.940.000.000,00 ₺
06.04.2023 tarihindeki güncel değeri: 34,84 ₺''',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
                height: 300,
                width: 200,
                child: PageView(children: [
                  Image.asset('assets/images/eregli1.jpg'),
                  Image.asset('assets/images/eregli2.jpg'),
                  Image.asset('assets/images/eregli3.png'),
                  Image.asset('assets/images/eregli4.png'),
                  Image.asset('assets/images/eregli5.jpg'),
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
