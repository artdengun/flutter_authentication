import 'package:flutter/material.dart';
import '../mixins/validation.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Validation{
  final formKey = GlobalKey<FormState>(); //MEMBUAT GLOBAL KEY UNTUK VALIDASI

  // DEFINE VARIABLE
  String name = '';
  String email = '';
  String password = '';


  // CODE LAINNYA YANG TELAH DIBUAT ..

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0), // set margin dari container
      child: Form(
        key: formKey, // menggunakan global key
        child: Column(
          children: [
            namaField(),
            emailField(),
            passwordField(),
            registerButton(),
          ],
        ),
      ),
    );
  }

 Widget namaField() {
    // membuat text lanjut
   return TextFormField(
     decoration: InputDecoration(
        labelText: 'Nama Lengkap'  // dengan label nama lengkap
     ),
     // disini akan berisi validation
       validator: validateName, //validateName ADALAH NAMA FUNGSI PADA FILE validation.dart
       onSaved: (String value) { //KETIKA LOLOS VALIDASI
         name = value; //MAKA VARIABLE name AKAN DIISI DENGAN TEXT YANG TELAH DI-INPUT
       },
   );
 }

 Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // keyboard typenya adalah email addres
      // agar symbol @ diletakan didepan ketika keyboard di tampilkan
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@example.com',
      ),
      // validation disini
        validator: validateEmail, //BERLAKU SAMA DENGAN HELPERS SEBELUMNYA
        onSaved: (String value) {
          email = value;
        },
    );
 }

 Widget passwordField(){
    return TextFormField(
    obscureText: true, // ketika di obsecureText bernilai true maka sama dengan password pada html
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
      ),
      // validation akan berisi disini
      validator: validatePassword, ////BERLAKU SAMA DENGAN HELPERS SEBELUMNYA
      onSaved: (String value) {
        password = value;
      },
    );
 }

 Widget registerButton(){
    // membuat tombol
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: (){
        // perintah yang akan di eksekusi jika tombol di tekan

      //formKey ADALAH GLOBAL KEY, KEMUDIAN DIIKUTI DENGAN currentState
      //LALU METHOD validate(), NILAINYA ADALAH FALSE / TRUE
      if (formKey.currentState.validate()) { //JIKA TRUE
        formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

        //DISINI KAMU BISA MENGHANDLE DATA YANG SDH DITAMPUNG PADA MASING-MASING VARIABLE
        //KAMU DAPAT MENGIRIMNYA KE API ATAU APAPUN
        //NAMUN UNTUK SEMENTARA KITA PRINT KE CONSOLE SAJA
        //KARENA BELUM MEMBAHAS TENTANG HTTP REQUEST
        print('Nama lengkap: $name');
        print('Email: $email');
        print('Passwor: $password');
        }
      },
      child: Text('Daftar'), // teks yang akan ditampilkan pada tombol
    );
 }

}
