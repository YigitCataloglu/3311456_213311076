import 'package:flutter/material.dart';
import 'banka1.dart';

class Giris extends StatefulWidget {
  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  final _formKey = GlobalKey<FormState>();
  final _kullaniciKontrol = TextEditingController();
  final _parolaKontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        decoration: BoxDecoration(
            /*        image: DecorationImage(
            image: AssetImage("assets/images/vog.png"),
            fit: BoxFit.cover,
          ), */
            ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logoson.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  TextFormField(
                    controller: _kullaniciKontrol,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(0, 111, 135, 144)
                          .withOpacity(0.7), // arka kısım renk
                      hintText: "Müsteri No/TCKN",
                      prefixIcon: Icon(Icons.person,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Musteri No/TCKN bos birakilamaz";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _parolaKontrol,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Color.fromARGB(0, 111, 135, 144).withOpacity(0.7),
                      hintText: "Parola",
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Parola bos birakilamaz!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    width: 200,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String password = _parolaKontrol.text;
                          String username = _kullaniciKontrol.text;
                          // Kullanıcı doğrulama işlemi
                          // Eğer doğruysa giriş yapılacak
                          // Değilse hata mesajı verilecek
                          if (username == "123" && password == "123") {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BankaBaslik(),
                              ),
                            );
                            // Giriş işlemi
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Parola Hatasi'), // BURAYI TASARLA BURASI HATALI GİRİŞ BLOĞU
                                  content: Text('Lütfen parolanizi kontrol edip tekrar giriniz'),
                                  actions: <Widget>[
                                    TextButton(
                                      
                                      child: Text('Tamam',style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                            color: Color.fromARGB(255, 116, 105, 104),
                            width: 2.0),
                        primary: Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                      ),
                      child: Text(
                        "Giris Yap",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Sifremi Unuttum?",
                      style: TextStyle(
                        fontFamily: 'PT Serif',
                        color: Color.fromARGB(255, 130, 120, 119),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Musteri Ol',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(97, 111, 135, 144),
                          side: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 2.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
