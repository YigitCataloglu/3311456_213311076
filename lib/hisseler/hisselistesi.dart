import 'package:flutter/material.dart';
import 'package:vesis_bank/hisseler/hissebilgiwidget.dart';
import '../banka1.dart';

class Borsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'BORSA VESIS',
              style: TextStyle(color: Colors.black),
            )),
            backgroundColor: Colors.white60,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: AnaSayfa(),
          ))),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HisseTanitim(
                              logo: 'assets/images/sisecam_yatay_logo.png',
                              HisseBilgi:
                                  '''Atatürk’ün direktifleriyle 1935 yılında Türkiye İş Bankası tarafından kurulan Şişecam,85 yılı  aşan geçmişiyle Türkiye’nin en köklü sanayi kuruluşlarından biri olmanın yanısıra 
ihtisaslaşma derecesi ve rekabet gücü yüksek faaliyetleriyle dünyanın en seçkin üreticileri arasında yer almaktadır. 
Ülkemiz​in temel cam ürünleri gereksinimini karşılamak üzere kurulan Şişecam, 
günümüzde Türkiye’nin en güçlü sanayi kuruluşlarından biri olmanın ötesinde,
camın tüm temel alanları ile soda ve krom bileşiklerini kapsayan iş kollarında küresel bir oyun kurucuya dönüşmüştür.''',
                              HisseBilgi2: '''
Borsa islem kodu: SISE
Sermaye: 3.063.214.056
Piyasa Değeri:132.269.582.945,42 ₺
06.04.2023 tarihindeki güncel değeri: 43.18₺''',
                              fotograf1: 'assets/images/sisecam1.jpg',
                              fotograf2: 'assets/images/sisecam2.jpg',
                              fotograf3: 'assets/images/sisecam3.jpg',
                            )));
              },
              child: Container(
                child: Demo(
                    isim: 'SISE',
                    fotograf: 'assets/images/sisecam_logo.png',
                    fiyat: 45),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HisseTanitim(
                              logo: 'assets/images/erdemir-logo.png',
                              HisseBilgi:
                                  '''Erdemir, 1960'ta devlet tarafından Karadeniz Ereğli'de kurulan ve 2006'da özelleştirilerek OYAK'a devredilen demir ve çelik fabrikası. Şirket 11 Mayıs 1960 tarihinde resmen kurulmuş olup fabrika kurulması 42 ay sürmüş ve 15 Mayıs 1965'te işletmeye alınmıştır. İlk kurulduğunda kamu kuruluşu olan Erdemir, 2006 yılından itibaren Oyak Grubu bünyesinde faaliyet göstermektedir. Türkiye'nin en büyük yassı demir üreticisidir''',
                              HisseBilgi2: '''
Borsa islem kodu: EREGL
Sermaye: 3.500.000.000
Piyasa Değeri:121.940.000.000,00 ₺
06.04.2023 tarihindeki güncel değeri: 34,84₺''',
                              fotograf1: 'assets/images/eregli1.jpg',
                              fotograf2: 'assets/images/eregli2.jpg',
                              fotograf3: 'assets/images/eregli3.png',
                            )));
              },
              child: Container(
                  child: Demo(
                      isim: 'EREGL',
                      fotograf: 'assets/images/erdemir-logo.png',
                      fiyat: 33)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HisseTanitim(
                              logo: 'assets/images/fordotosan.png',
                              HisseBilgi:  '''Ford Otosan, 1959 yılında Vehbi Koç tarafından Acıbadem, Üsküdar'da kurulmuş Türk otomotiv şirketidir.

1997 yılında Koç Holding ve Ford hisselerinin eşitlenmesiyle Ford Otosan kurulmuştur. 1966-1984 yılları arasında Anadol marka araçları üreten Otosan, ilerleyen yıllarda Ford'un Taunus, Escort, Transit, Connect ve Courier modellerini üretmiştir. Ford Otosan bünyesinde İhsaniye Merkez, Gölcük, Yeniköy Merkez, Başiskele, Kocaeli ve İnönü, Eskişehir Fabrikaları, Cevizli, Kartal Yedek parça Merkezi ve Akpınar, Sancaktepe AR-GE Merkezi'nde toplamda 10.000 üzerinde kişi çalışmaktadır. Ford Otosan araç ihracatının yanı sıra son 5 senedir 320 milyon doların üzerinde mühendislik ihracatı yapmıştır. ''',
                              HisseBilgi2: '''

Borsa islem kodu: FROTO
Sermaye: 350.910.000
Piyasa Değeri:213.704.190.000,00 ₺
06.04.2023 tarihindeki güncel değeri: 609,00₺''',
                              fotograf1: 'assets/images/ford4.png',
                              fotograf2: 'assets/images/ford3.jpg',
                              fotograf3: 'assets/images/ford5.jpg',
                            )));
              },
              child: Container(
                child: Demo(
                    isim: 'FROTO',
                    fotograf: 'assets/images/fordlogo.png',
                    fiyat: 592),
              ),
            ),
           TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HisseTanitim(
                              logo: 'assets/images/tofaslogo2.png',
                              HisseBilgi:  '''TOFAŞ (Türk Otomobil Fabrikası A.Ş.), 1968 yılında Koç Topluluğu’nun kurucusu Vehbi Koç tarafından kuruldu. Üretim fabrikası Demirtaş, Osmangazi’de yer alan, Koç Holding ve Fiat'ın (FCA) eşit hissedar olduğu kuruluş, bugün %37,8 Fiat, %37,8 Koç Holding ve %24,3 diğer ortaklara ait ortaklık yapısıyla faaliyetlerine devam etmektedir. Tofaş, hem binek hem de hafif ticari araç üretebilen bir otomotiv şirketidir. Türk otomotiv sanayisinin büyük üreticilerinden biri olan Tofaş, yılda 450 bin araçlık üretim kapasitesine ve 10.000'den fazla çalışana sahiptir. 

2013’te Fiat Chrysler Automobiles’ın 175 fabrikasında uygulanan WCM - Dünya Klasında Üretim Programı kapsamında “Altın Seviye”ye ulaşan Tofaş’ın Bursa’daki fabrikasında, Fiat’ın yanı sıra Citroën, DS, Peugeot, Opel ve Vauxhall markaları için de üretim yapılmaktadır.''',
                              HisseBilgi2: '''

Borsa islem kodu: TOASO
Sermaye: 500.000.000
Piyasa Değeri:101.500.000.000,00 ₺
06.04.2023 tarihindeki güncel değeri: 203,00₺''',
                              fotograf1: 'assets/images/tofas5.png',
                              fotograf2: 'assets/images/tofas1.jpg',
                              fotograf3: 'assets/images/tofas2.png',
                            )));
              },
              child: Container(
                child: Demo(
                  isim: 'TOASO',
                  fotograf: 'assets/images/tofaslogo.png',
                  fiyat: 205,
                ),
              ),
            ),
            ElevatedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BankaBaslik()),
                  );
                }),
          ],
        )
      ],
    );
  }
}

class Demo extends StatelessWidget {
  String isim;
  String fotograf;
  int fiyat;

  Demo({required this.isim, required this.fotograf, required this.fiyat});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.blue, //gölgelendirme rengi
      elevation: 12, //gölgelendirme boyutu
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset('$fotograf'),
          backgroundColor: Colors.white,
        ),
        title: Text('$isim'),
        trailing: Text('Hisse Fiyati : $fiyat ₺'),
      ),
    );
  }
}
