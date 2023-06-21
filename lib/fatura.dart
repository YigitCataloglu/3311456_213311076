import 'package:flutter/material.dart';

class FaturaSayfasi extends StatefulWidget {
  @override
  _FaturaSayfasiState createState() => _FaturaSayfasiState();
}

class _FaturaSayfasiState extends State<FaturaSayfasi> {
  String faturaSecimi = 'Elektrik Faturası';
  TextEditingController paraControl = TextEditingController();
  TextEditingController hesapNoControl = TextEditingController();

  List<String> faturalar = [
    'Elektrik Faturası',
    'Su Faturası',
    'Doğalgaz Faturası',
    'İnternet Faturası',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: Text('Fatura Ödeme' ,style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fatura Türü',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: faturaSecimi,
              onChanged: (newValue) {
                setState(() {
                  faturaSecimi = newValue!;
                });
              },
              items: faturalar.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Fatura Tutarı',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: paraControl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Fatura Tutarını Girin',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hesap Numarası',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: hesapNoControl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Hesap Numarasını Girin',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Fatura ödeme işlemleri burada gerçekleştirilebilir
                String faturaTur = faturaSecimi;
                double para = double.parse(paraControl.text);
                String hesapNo = hesapNoControl.text;
                

                // Fatura ödeme işlemlerini gerçekleştir ve kullanıcıya geri bildirim ver
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Fatura Ödeme'),
                      content: Text('Seçilen Fatura Türü: $faturaTur\n'
                          'Ödenen Tutar: $para\n'
                          'Hesap Numarası: $hesapNo\n'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tamam'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 140, 142, 145), // Düğme arkaplan rengi
    onPrimary: Color.fromARGB(255, 255, 255, 255), // Düğme metin rengi
  ),
              child: Text('Ödeme Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
