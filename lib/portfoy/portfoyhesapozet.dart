import 'package:flutter/material.dart';

class HesapOzeti extends StatefulWidget {
  @override
  _HesapOzetiState createState() => _HesapOzetiState();
}

class _HesapOzetiState extends State<HesapOzeti> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView(
            children: [
              Center(child: Text('HESAP ÖZETİ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),      
              HesapOzetiPortfoy(aciklama: 'Toplam portfoy', para: '303.345,00',arkarenk: Colors.grey.shade400),
              HesapOzetiPortfoy(aciklama: 'Hisse senedi', para: '290.845,00'),
              HesapOzetiPortfoy(aciklama: 'Fon blokaji', para: '0,00',arkarenk: Colors.grey.shade400),
              HesapOzetiPortfoy(aciklama: 'T+1 HAREKET TOPLAMI', para: '12.500,00'),
              HesapOzetiPortfoy(aciklama: 'T+2 HAREKET TOPLAMI', para: '12.500,00',arkarenk: Colors.grey.shade400),
              HesapOzetiPortfoy(aciklama: 'MENKUL KIYMET TOPLAMI', para: '290.845,00'),
              HesapOzetiPortfoy(aciklama: 'Kull G. içi HS Limiti', para: '12.475,00',arkarenk: Colors.grey.shade400),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.bottomCenter,
      child: ElevatedButton(
         style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 128, 131, 133), 
    onPrimary: Color.fromARGB(255, 254, 254, 254), 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
        onPressed: () {
          _showBottomSheet(context);
        },
        child: Text('Hesap Özeti'),
      ),
    );
  }
}
class HesapOzetiPortfoy extends StatefulWidget {  
String aciklama,para;
Color arkarenk;
HesapOzetiPortfoy({required this.aciklama,required this.para, this.arkarenk=Colors.white});
  @override
  State<HesapOzetiPortfoy> createState() => _HesapOzetiPortfoyState();
}
class _HesapOzetiPortfoyState extends State<HesapOzetiPortfoy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: widget.arkarenk,
        border: Border(bottom: BorderSide(width: 2.0, color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           Expanded(flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('${widget.aciklama}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            ),
          ),
          Expanded(flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('${widget.para}',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            ),
          ),
        ],
      ),
      );
  }
}