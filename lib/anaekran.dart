import 'package:flutter/material.dart';
import 'Widgetlar/karttasarim.dart';
import 'hesaphareketleri.dart';
import 'paratransferi.dart';
import 'portfoy/portfoy.dart';
import 'hisseler/tumhisseler.dart';
import 'Widgetlar/kartbilgileri.dart';


class AnaEkranim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: ListView(
      padding: EdgeInsets.all(0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient( 
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 134, 159, 162),
                    Color.fromARGB(255, 100, 138, 134),
                  ],
                ),
              ),
              child: Column(children: [
                Text(
                  'HESAPLARIM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                    onTap: () {  
                      // NAVİGATÖR EKLEYECEN UNUTMA
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KartBilgileri()),
              );

                    },

                  child: Container(
                    width: 300,
                    height: 200,
                    child: PageView(children: [
                      Container(
                        child: KartTasarim(
                          renk: Color.fromARGB(255, 230, 225, 225),
                          genislik: 300,
                          yuksek: 195,
                          yazirenk: Colors.black,
                        ),
                      ),
                      Container(
                        child: KartTasarim(
                          renk: Color.fromARGB(255, 224, 145, 81),
                          genislik: 300,
                          yuksek: 195,
                          yazirenk: Colors.black,
                        ),
                      ),
                      Container(
                        child: KartTasarim(
                          renk: Color.fromARGB(255, 0, 0, 0),
                          genislik: 300,
                          yuksek: 195,
                        ),
                      ),
                    ]),
                  ),
                )
              ]),
              
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'HIZLI İŞLEMLER',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hizlislemler(
                          metin: 'Havale/EFT',
                          ikon: Icons.send,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParaTransferi()),
                            );
                          },
                        ),
                        Hizlislemler(metin: 'Fatura', ikon: Icons.description,onPressed: () {
                           
                          },),
                        Hizlislemler(metin: 'Portföy', ikon: Icons.show_chart,onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Portfoy()),
                            );
                          

                        },),
                        Hizlislemler(
                            metin: 'Kart Başvuru',
                            ikon: Icons.add_card_rounded,onPressed: () {
                              
                            },),
                        Hizlislemler(
                            metin: 'Hesap Hareketleri', ikon: Icons.list,onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HesapHareketleri()),
                            );
                            },),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          color: Color.fromARGB(255, 241, 241, 241),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: Text('Hizmetler',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Tüm İşlemler',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TumHisseler()),
              );
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: HizmetlerKare(logo: 'assets/images/borsa3.png',baslik: 'Hisse Senedi Listesi',altbaslik: 'Hemen Yatirim Yapin'),
                    ),
                  ),
                  InkWell(onTap: () {
                    
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                       child: HizmetlerKare(logo: 'assets/images/doviz.png',baslik: 'Doviz Alim Satim' ,altbaslik:'Hemen Yatirim Yapin' ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {
                    
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: HizmetlerKare(logo: 'assets/images/kkart.png',baslik: 'KARTLARIM',altbaslik: ''),
                    ),
                  ),
                  InkWell(onTap: () {
                    
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                       child: HizmetlerKare(logo: 'assets/images/varliklarlogo3.png',baslik: 'VARLIKLARIM' ,altbaslik:'' ),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ],
    ));
  }
}
/**********************************     HİZMETLER WİDGETİM     **********************************************/
class HizmetlerKare extends StatelessWidget {
 
 String baslik;
 String altbaslik;
 String logo;
 HizmetlerKare({required this.baslik,required this.altbaslik,required this.logo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(


 decoration: BoxDecoration(
               
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(10, 10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 100, 138, 134)
                        .withOpacity(0.5),
                    blurRadius: 25,
                    offset: Offset(0, 4),
                  )
                ],),

        child: Column(
          children: [
            Container(
              width: 180,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$logo'),
                ),
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(25, 25)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.5),
                    blurRadius: 25,
                    offset: Offset(0, 4),
                  )
                ],
              ),
            ),
            Text(
              '$baslik',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$altbaslik',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

/* *********************************       HİZLİ İŞLEMLER WİDGETİM    ****************************************** */
class Hizlislemler extends StatefulWidget {
  String metin;
  IconData ikon;
  final void Function()? onPressed;
  Hizlislemler({required this.metin, required this.ikon, this.onPressed});

  @override
  State<Hizlislemler> createState() => _HizlislemlerState();
}

class _HizlislemlerState extends State<Hizlislemler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 100, 138, 134),
            blurRadius: 13,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: widget.onPressed,
           

            icon: Icon(widget.ikon),
            iconSize: 35,
          ),
          Text(
            widget.metin,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
/* ************************************************************************************************ */