import 'package:flutter/material.dart';

import 'banka1.dart';

class HesapHareketleri extends StatefulWidget {
  HesapHareketleri();

  @override
  State<HesapHareketleri> createState() => _HesapHareketleriState();
}

class _HesapHareketleriState extends State<HesapHareketleri> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('  HESAP HAREKETLERİ ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Container(alignment: Alignment.topRight , child:IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BankaBaslik(),));
                      
                    }, icon: Icon(Icons.exit_to_app)) ,),
                  ],
                ),
                
                
                MyHesapHareketleri(baslik: 'Y***T  C******LU KISINIE PARA TRANSFERİ',altbaslik: 'NO:1233214',ucret2: '3350'  ),
         
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyHesapHareketleri extends StatefulWidget {
  
   String baslik;
   String altbaslik;
   String? ucret2;
   int ucret ;

  MyHesapHareketleri({required this.baslik,required this.altbaslik,this.ucret=5, this.ucret2});

  

  @override
  State<MyHesapHareketleri> createState() => _MyHesapHareketleriState();
}

class _MyHesapHareketleriState extends State<MyHesapHareketleri> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
      
              Card(
                color: widget.ucret >=0?Color.fromARGB(255, 122, 184, 41):Color.fromARGB(255, 225, 62, 47),
                shadowColor: Colors.blue, //gölgelendirme rengi
                elevation: 12, //gölgelendirme boyutu
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.white,
                  ),
                  title: Text('${widget.baslik}'),
                  subtitle: Text('${widget.altbaslik}'),
                  trailing: Text('${widget.ucret2} ₺'),
                ),
              ),
                    
      
                    
                    Demoo2(baslik: 'BORSA HESABINA VIRMAN',altbaslik: 'NO:4365464',ucret: -11300  ),
                    Demoo2(baslik: 'Kredi Karti Ödemesi',altbaslik: '2423*******4324',ucret: -2200 ),
                    Demoo2(baslik: 'H*****E ***DE',altbaslik: '8657*******4543',ucret: 750 ),
                    Demoo2(baslik: 'SANAL POS ALISVERIS (YURTİCİ)',altbaslik: '1534*****1356',ucret: -300 ),
                    Demoo2(baslik: 'GELEN ODEME',altbaslik: '4329******1756',ucret: 25750 ),
                    Demoo2(baslik: 'YATIRIM HAVUZ HESABINA VIRMAN',altbaslik: 'NO: 43288540',ucret: 2700),
                    Demoo2(baslik: 'SANAL POS ALISVERIS (YURTİCİ)',altbaslik: '1534*****1356',ucret: -370),
                    Demoo2(baslik: 'A*** B******Z KISISINE FAST ILE GONDERILEN',altbaslik: '1534*****1356',ucret: -500 ),
                    Demoo2(baslik: 'E****DA  ***E',altbaslik: '4324*****1321',ucret: 500 ),
                    Demoo2(baslik: 'GELEN ODEME',altbaslik: '4329******1756',ucret: 2750 ),
                    Demoo2(baslik: 'SANAL POS ALISVERIS (YURTİCİ)',altbaslik: '1534*****1356',ucret: 300 ),
                    Demoo2(baslik: 'ATM DEN YATIRILAN PARA',altbaslik: 'NO: 12345678',ucret: 600),
                    Demoo2(baslik: 'E******R C*****K KISISINE FAST ILE GONDERILEN',altbaslik: '1534*****1356',ucret: -700 ),
                    Demoo2(baslik: 'GELEN ODEME',altbaslik: '4329******1756',ucret: 22750 ),
          
      
          ElevatedButton(
              child: Text('ANA SAYFAYA DON'),   
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BankaBaslik()),
                );
              }),
          // DÜZELTMEYE GİT 
          
          
            ],
            
            
          ),
          
        ),
      ),
    );
  }
}


class Demoo2 extends StatefulWidget {
  
   String baslik;
   String altbaslik;
   String? ucret2;
   int ucret ;

  Demoo2({required this.baslik,required this.altbaslik,this.ucret=5, this.ucret2});

  

  @override
  State<Demoo2> createState() => _Demoo2State();
}

class _Demoo2State extends State<Demoo2> {



  @override
  Widget build(BuildContext context) {
    return Container(color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Card(
            color: widget.ucret >=0?Color.fromARGB(255, 122, 184, 41):Color.fromARGB(255, 225, 62, 47),
            shadowColor: Colors.blue, //gölgelendirme rengi
            elevation: 12, //gölgelendirme boyutu
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.white,
              ),
              title: Text('${widget.baslik}'),
              subtitle: Text('${widget.altbaslik}'),
              trailing: Text('${widget.ucret} ₺'),
            ),
          ),
        
        ],
        
        
      ),
      
    );
  }
}
