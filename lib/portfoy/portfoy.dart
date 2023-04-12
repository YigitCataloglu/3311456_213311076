import 'package:flutter/material.dart';
import '../banka1.dart';
import 'portfoyhesapozet.dart';


class Portfoy extends StatelessWidget {
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
                    Text('   PORTFOYUM',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                          flex: 2,
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
                            textAlign: TextAlign.right,
                            'Adet',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Maliyet',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Top. K/Z',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
        ListeTasarim2(sembol: 'FROTO',adet: 20,maliyet: 320,karzarar: ((592-320)*20)),  
        ListeTasarim2(sembol: 'BIMAS',adet: 50,maliyet: 63,karzarar: ((157*50)-(63*50))),
        ListeTasarim2(sembol: 'EREGL',adet: 300,maliyet: 52,karzarar: ((33*300)-(52*300))),
        ListeTasarim2(sembol: 'TOASO',adet: 45,maliyet: 150,karzarar: ((205*45)-(150*45))),
        ListeTasarim2(sembol: 'SISE',adet: 1500,maliyet: 14,karzarar: ((45*1500)-(14*1500))),
        ListeTasarim2(sembol: 'ASELS',adet: 400,maliyet: 63,karzarar: ((53.20*400)-(63*400))),
        ListeTasarim2(sembol: 'TUPRS',adet: 1250,maliyet: 52,karzarar: ((78.40*1250)-(52*1250))),
        ListeTasarim2(sembol: 'THYAO',adet: 500,maliyet: 115,karzarar: ((130.5*500)-(115*500))),
        ListeTasarim2(adet: 12500, maliyet: 1, sembol: 'TRY', karzarar: 0),
        SizedBox(height: 50,),
        HesapOzeti(),
        
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class ListeTasarim2 extends StatefulWidget {  
String sembol;
double adet,maliyet,karzarar;
ListeTasarim2({required this.adet,required this.maliyet,required this.sembol,required this.karzarar});

  @override
  State<ListeTasarim2> createState() => _ListeTasarim2State();
}

class _ListeTasarim2State extends State<ListeTasarim2> {
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
            flex: 2,
            child: Text(
              widget.sembol,                         //HİSSE ADI
              style: TextStyle(fontSize: 18.0),
            ),
          ),

 Expanded(
            flex: 2,
            child: Text(
              widget.adet.toStringAsFixed(2),     //ADET
              textAlign: TextAlign.end,
              
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              widget.maliyet.toStringAsFixed(2),        //MALİYET
              textAlign: TextAlign.right,
              
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
              //  border: Border.all(color: widget.karzarar >= 0 ? Colors.green : Colors.red ),
              //  color: widget.karzarar >= 0 ? Colors.green : Colors.red,           
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '${widget.karzarar.toStringAsFixed(2)}',                //KAR ZARAR
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18.0,
                //  color: Colors.white
                  color: widget.karzarar >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
          ),
         
        ],
      ),

      );
  }
}