import 'package:flutter/material.dart';


class HakkimizdaSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text('HAKKIMIZDA            ')),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logoson.png',
              width: 150.0,
              height: 150.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'VESİS BANK',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Bankamız 2020 yılında kurulan öncü bir finans kuruluşudur. Müşterilerimize en iyi hizmeti sunmak için sürekli olarak teknolojik yeniliklere odaklanıyoruz.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              'Misyonumuz',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Müşterilerimizin finansal hedeflerine ulaşmalarını sağlamak ve güvenilir bir bankacılık deneyimi sunmak için yenilikçi çözümler sunmak.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              'Vizyonumuz',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Teknoloji ve müşteri odaklı yaklaşımımızla bankacılık deneyimini dönüştürmek ve sektörde lider bir kuruluş olmak.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              'İletişim Bilgileri',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Adres: Ankara/Türkiye',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'Telefon: +90 444 66666',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'E-posta: bank@vesis.com',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
