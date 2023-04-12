import 'package:flutter/material.dart';
import 'banka1.dart';
import 'hesaphareketleri.dart';


class ParaTransferi extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:GirisEkrani());
  }
}



class GirisEkrani extends StatefulWidget {
  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}
  
class _GirisEkraniState extends State<GirisEkrani> {
  
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
       

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
  children: [
    
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Text(
            'Ad Soyad',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: t1,
            decoration: InputDecoration(
              
              hintText: 'Örn: Yigit Cataloglu',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
 
          ),
          SizedBox(height: 16),
          Text(
            'Tutar',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: t2,
            keyboardType: TextInputType.number,  // çalışmadı
            decoration: InputDecoration(
              hintText: 'Örn: 1500₺',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'IBAN',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: t3,
            decoration: InputDecoration(
              hintText: 'Örn: 7824 8432 4385 4234 6456 2434',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            
            
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHesapHareketleri(
                    baslik: t1.text,
                    ucret2: t2.text,
                    altbaslik: t3.text,
                  ),
                ),
              );
            },
            child: Text('Para Gönder'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF3F51B5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BankaBaslik()),
              );
            },
            child: Text('İptal Et'),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),

        ),
      );
    
  }
}


