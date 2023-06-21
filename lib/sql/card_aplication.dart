import 'dart:math';
import 'package:flutter/material.dart';

import 'card_database.dart';
import 'card_list.dart';


class CardApplicationPage extends StatefulWidget {
  @override
  _CardApplicationPageState createState() => _CardApplicationPageState();
}

class _CardApplicationPageState extends State<CardApplicationPage> {
  TextEditingController nameController = TextEditingController();
  List<CardInfo> cards = [];

  void generateCard(BuildContext context) {
    String name = nameController.text.trim();

    if (name.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Lütfen ad soyad bilgisini girin.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    } else {
      Random random = Random();
      String cardNumber = '';
      String cvv = '';
      String iban = '';
      String expiryDate = '';

      for (int i = 0; i < 16; i++) {
        cardNumber += random.nextInt(10).toString();
      }

      for (int i = 0; i < 3; i++) {
        cvv += random.nextInt(10).toString();
      }

      for (int i = 0; i < 24; i++) {
        iban += random.nextInt(10).toString();
      }

      int month = random.nextInt(12) + 1;
      int year = DateTime.now().year + random.nextInt(6);
      expiryDate = '$month/$year';

      CardInfo card = CardInfo(name, cardNumber, cvv, iban, expiryDate);
      setState(() {
        cards.add(card);
      });

      DatabaseHelper.instance.insertCard(card.toMap());

      nameController.clear();
    }
  }

  void viewCards(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardListPage(cards: cards)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        title: Text('Kart Başvuru',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white38,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                        style: TextStyle(
                            color: Colors.black),
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            hintText: 'Ad Soyad',
                            ),
                        cursorColor: Colors.black,
                      ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => generateCard(context),
              child: Text('Başvuru Yap'),
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 38, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => viewCards(context),
              child: Text('Kartları Görüntüle'),
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
