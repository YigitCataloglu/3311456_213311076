import 'package:flutter/material.dart';
import 'hesaphareketleri.dart';
import 'hisseler/tumhisseler.dart';
import 'paratransferi.dart';
import 'anaekran.dart';
import 'hisseler/hisselistesi.dart';
import 'login.dart';

class BankaBaslik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Image.asset('assets/images/logoson.png'),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Para Transferi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParaTransferi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Hesap Hareketleri'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HesapHareketleri()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.timeline),
                title: Text('Hisse Senetleri'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TumHisseler()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Hisse Bilgileri'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Borsa()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Hesaplarım'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Kartlarım'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Varlıklarım'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Döviz Alım Satımı'),
                onTap: () {

                },
              ),      
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Ödemeler'),
                onTap: () {

                },
              ),
               ListTile(
                leading: Icon(Icons.qr_code),
                title: Text('QR İşlemleri'),
                onTap: () {

                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white38,
          title: Center(
            child: Text(
              'VESIS BANK',
              style: TextStyle(
                  fontFamily: 'Philosopher', fontSize: 30, color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Giris()),
                );
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: BankaArayuz(),

        /*    Center(
          child: BankaArayuz(),
        ), */
      ),
    );
  }
}

class BankaArayuz extends StatefulWidget {
  @override
  State<BankaArayuz> createState() => _BankaArayuzState();
}

class _BankaArayuzState extends State<BankaArayuz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 100,
            child: Container(
              child: Center(child: AnaEkranim()), // SAYFA 1
            ),
          ),
        ),
      ],
    );
  }
}
