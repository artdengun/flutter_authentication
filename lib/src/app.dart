import 'package:flutter/material.dart';
import 'screens/register.dart';


class App extends StatelessWidget{
  Widget build(contex){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          leading: Icon(Icons.add_circle_outline),
          title: Text("TEMPAT PENDAFTARAN"),
          actions: [
            Icon(Icons.search),
          ],
        ),
        body: RegisterScreen(),
      ),
    );
  }
}