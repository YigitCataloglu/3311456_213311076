import 'package:flutter/material.dart';

class KartTasarim extends StatefulWidget {
  Color renk;
  double genislik;
  double yuksek;
  Color yazirenk;
  KartTasarim({required this.renk,this.genislik=300,this.yuksek=200,this.yazirenk=Colors.white});

  @override
  State<KartTasarim> createState() => _KartTasarimState();
}

class _KartTasarimState extends State<KartTasarim> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: widget.genislik,
        height: widget.yuksek,
        decoration: BoxDecoration(
          color: widget.renk,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'KART NUMARASI',
                style: TextStyle(
                  color: widget.yazirenk.withOpacity(0.6),
                  fontSize: 12.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '**** **** **** 1234',
                style: TextStyle(
                  color: widget.yazirenk,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'İSİM SOYİSİM',
                        style: TextStyle(
                          color: widget.yazirenk.withOpacity(0.6),
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Yigit Cataloglu',
                        style: TextStyle(
                          color: widget.yazirenk,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SKT',
                        style: TextStyle(
                          color: widget.yazirenk.withOpacity(0.6),
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '12/24',
                        style: TextStyle(
                          color: widget.yazirenk,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  'assets/images/mastercard_logo.png',
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}