import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;

 

  void loginUserEmailAndPassword() async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: _kullaniciKontrol.text, password: _parolaKontrol.text);
      var myUser = userCredential.user;
      if (!myUser!.emailVerified) {
        await myUser.sendEmailVerification();
      } else {
        debugPrint(
            'Kullanıcının e-postası onaylanmış, ilgili sayfaya gidebilir.');
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BankaBaslik()),
      );
      debugPrint(userCredential.toString());
    } catch (e) {
      showErroeMessage();
      debugPrint(e.toString());
    }
  }

  void showErroeMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email veya Parola Hatasi'),
          content:
              Text('Lütfen bilgilerinizi kontrol edip tekrar girermisiniz'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tamam',
                style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(0, 111, 135, 144)
                          .withOpacity(0.7), // arka kısım renk
                      hintText: "Müşteri No/TCKN",
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
                        return "Müşteri No/TCKN boş bırakılamaz";
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
                        return "Parola boş bırakılamaz!";
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
                          loginUserEmailAndPassword();
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
                        "Giriş Yap",
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
                      "Şifremi Unuttum?",
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BankaBaslik()),
                        );
                      },
                      child: Text(
                        'Müşteri Ol',
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
