import 'package:flutter/material.dart';

import 'hisselistesi.dart';

class HisseTanitim extends StatefulWidget {
  String HisseBilgi, HisseBilgi2, fotograf1, fotograf2, fotograf3, logo;
  HisseTanitim(
      {this.HisseBilgi = ' ',
      this.HisseBilgi2 = ' ',
      this.fotograf1 = ' ',
      this.fotograf2 = ' ',
      this.fotograf3 = ' ',
      required this.logo});
  @override
  State<HisseTanitim> createState() => _HisseTanitimState();
}

class _HisseTanitimState extends State<HisseTanitim> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hisse logosu',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('${widget.logo}'), // hisse logo
        ),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '''${widget.HisseBilgi}''',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('''${widget.HisseBilgi2}''',
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                      height: 300,
                      width: 200,
                      child: PageView(children: [
                        Image.asset('${widget.fotograf1}'),
                        Image.asset('${widget.fotograf2}'),
                        Image.asset('${widget.fotograf3}'),
                      ])),
                  ElevatedButton(
                      child: Text('Hisse Listesi'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Borsa()),
                        );
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
