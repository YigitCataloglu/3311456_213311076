import 'package:flutter/material.dart';

import 'card_database.dart';

import 'package:flutter/material.dart';

class CardListPage extends StatefulWidget {
  final List<CardInfo> cards;

  const CardListPage({required this.cards});

  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  List<CardInfo> cards = [];

  @override
  void initState() {
    super.initState();
    fetchCards();
  }

  void fetchCards() async {
    List<Map<String, dynamic>> cardMaps = await DatabaseHelper.instance.getCards();
    setState(() {
      cards = cardMaps.map((map) => CardInfo.fromMap(map)).toList();
    });
  }

  void deleteCard(CardInfo card) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Kartı Sil'),
        content: Text('Kartı silmek istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('İptal'),
          ),
          TextButton(
            onPressed: () async {
              await DatabaseHelper.instance.deleteCard(card.cardNumber);
              setState(() {
                cards.remove(card);
              });
              Navigator.pop(context);
            },
            child: Text('Sil'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kart Listesi'),
        backgroundColor: Colors.white38,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            CardInfo card = cards[index];
            return Card(
              child: Container(
                height: 225,
                width: 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(186, 192, 153, 1),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Ad Soyad: ${card.name}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 7, 7),
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Kart Numarası: ${card.cardNumber}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'CVV: ${card.cvv}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'SKT: ${card.expiryDate}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'IBAN:  ${card.iban}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 0, 0),               //onprimary buton rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
                      
                      onPressed: () => deleteCard(card),
                      child: Text('Kartı Sil'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
