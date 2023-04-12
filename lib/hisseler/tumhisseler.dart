
import 'package:flutter/material.dart';
import '../banka1.dart';

class TumHisseler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Borsa Hisseleri',
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('  BİST HİSSE ENDEKSLERİ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Container(alignment: Alignment.topRight , child:IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BankaBaslik(),));
                      
                    }, icon: Icon(Icons.exit_to_app)) ,),
                  ],
                ),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Hisse Adı',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Son Fiyat',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '%Fark',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
        ListeTasarim(sembol: 'SISE',fark: 5.32,fiyat: 45,),
        ListeTasarim(sembol: 'FROTO',fark: -0.77,fiyat: 592,),
        ListeTasarim(sembol: 'TOASO',fark: 1.99,fiyat: 205,),
        ListeTasarim(sembol: 'BIMAS',fark: 1.94,fiyat: 157,),
        ListeTasarim(sembol: 'EREGL',fark: -7,fiyat: 33,),
        ListeTasarim(sembol: 'TUPRS',fark: 2.15,fiyat: 78.4,),
        ListeTasarim(sembol: 'ARCLK',fark: -0.21,fiyat: 117,),
        ListeTasarim(sembol: 'GARAN',fark: -1.54,fiyat: 25.20,),
        ListeTasarim(sembol: 'AKBNK',fark: -4,fiyat: 16.59,),
        ListeTasarim(sembol: 'YKBNK',fark: 2.17,fiyat: 9.90,),
        ListeTasarim(sembol: 'SASA',fark: 3.36,fiyat: 107.70,),
        ListeTasarim(sembol: 'KOZAA',fark: 2.87,fiyat: 22.20,),
        ListeTasarim(sembol: 'KCHOL',fark: -0.1,fiyat: 78.95,),
        ListeTasarim(sembol: 'ASELS',fark: 2.01,fiyat: 53.20,),
        ListeTasarim(sembol: 'ALARK',fark: 2.21,fiyat: 71.5,),
        ListeTasarim(sembol: 'EKGYO',fark: -3.15,fiyat: 6.85,),
        ListeTasarim(sembol: 'THYAO',fark: 2.43,fiyat: 130.5,),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class ListeTasarim extends StatefulWidget {  
String sembol;
double fiyat,fark;
ListeTasarim({required this.fark,required this.fiyat,required this.sembol});

  @override
  State<ListeTasarim> createState() => _ListeTasarimState();
}

class _ListeTasarimState extends State<ListeTasarim> {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2.0, color: Colors.grey)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              widget.sembol,
              style: TextStyle(fontSize: 18.0),
            ),
          ),

 Expanded(
            flex: 2,
            child: Text(
              widget.fiyat.toStringAsFixed(2),
              textAlign: TextAlign.start,
              
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: widget.fark >= 0 ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '${widget.fark.toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
         
        ],
      ),

      );
  }
}