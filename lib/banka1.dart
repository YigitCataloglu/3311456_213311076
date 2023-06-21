import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vesis_bank/hakkimizda.dart';
import 'package:vesis_bank/varliklarim.dart';
import 'api/doviz.dart';
import 'fatura.dart';
import 'hesaphareketleri.dart';
import 'hesaplarim.dart';
import 'hisseler/tumhisseler.dart';
import 'paratransferi.dart';
import 'anaekran.dart';
import 'hisseler/hisselistesi.dart';
import 'giris_kayit/login.dart';

class BankaBaslik extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signout() async {
    print('oturum kapatildi');
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
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
                    MaterialPageRoute(builder: (context) => canliBorsa()),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HesaplarSayfasi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Kartlarım'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Varlıklarım'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VarliklarSayfasi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Döviz Alım Satımı'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DovizListesi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Faturalar'),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaturaSayfasi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment),
                title: Text('Hakkimizda'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HakkimizdaSayfasi()),
                  );
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
                signout();
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
