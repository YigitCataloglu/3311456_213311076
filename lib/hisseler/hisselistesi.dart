import 'package:flutter/material.dart';
import '/hisseler/ereglbilgi.dart';
import '/hisseler/sisebilgi.dart';
import '/hisseler/toasobilgi.dart';
import '../banka1.dart';
import 'frotobilgi.dart';


class Borsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            
            title: Center(child: Text('BORSA VESIS',style: TextStyle(color: Colors.black),)),
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
          
          
          
       
 TextButton(onPressed: () {
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => sise ()));
    },
    child: Container(child: Demo(isim: 'SISE',fotograf:'assets/images/sisecam_logo.png',fiyat: 45),),
    ),

          TextButton(onPressed: () {
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => eregl ()));
    },
    child: Container(child: Demo(isim: 'EREGL',fotograf:'assets/images/erdemir-logo.png',fiyat: 33)),
    ),

      TextButton(onPressed: () {
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => froto ()));
    },
    child: Container(child: Demo(isim: 'FROTO',fotograf:'assets/images/fordlogo.png',fiyat: 592),),
    ),

      TextButton(onPressed: () {
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => toaso ()));
    },
    child: Container(child: Demo(isim: 'TOASO',fotograf:'assets/images/tofaslogo.png',fiyat: 205,),),
    ),
       

ElevatedButton(
                child: Text(
                    'Geri Dön'),
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
  
  
  Demo({required this.isim,required this.fotograf,required this.fiyat});
  @override
  Widget build(BuildContext context) {
    return  Card(
          color: Colors.white,
          shadowColor: Colors.blue,//gölgelendirme rengi
          elevation: 12, //gölgelendirme boyutu
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(child: Image.asset('$fotograf'),backgroundColor: Colors.white,),
            title: Text('$isim'),
            trailing: Text('Hisse Fiyati : $fiyat ₺'),
            
          ),
          
        );
  }
}


