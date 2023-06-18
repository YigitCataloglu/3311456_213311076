import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../banka1.dart';

class MusteriOl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'Kayıt Ol',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      firestore();
      print('calisti');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BankaBaslik()),
      );
    }
  }

  void firestore() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.email)
        .set({
      'Ad': _nameController.text,
      'Soyad': _surnameController.text,
      'mail': _emailController.text,
      'sifre': _passwordController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(0, 111, 135, 144)
                      .withOpacity(0.7), // arka kısım renk
                  hintText: "İsim",
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'İsim boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25.0),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(0, 111, 135, 144)
                      .withOpacity(0.7), // arka kısım renk
                  hintText: "Soyisim",
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Soyisim boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(0, 111, 135, 144)
                      .withOpacity(0.7), // arka kısım renk
                  hintText: "E-posta",
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'E-posta boş bırakılamaz';
                  }
                  // E-posta formatını burada kontrol edebilirsiniz.
                  return null;
                },
              ),
              SizedBox(height: 25.0),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(0, 111, 135, 144)
                      .withOpacity(0.7), // arka kısım renk
                  hintText: "Şifre",
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Şifre boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 36.0),
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _register,
                      child: Text('Kayıt Ol'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(97, 111, 135, 144),
                        side: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
