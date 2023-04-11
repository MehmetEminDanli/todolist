import 'package:flutter/material.dart';
import 'dart:math';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rastgelesayı',
      theme: ThemeData.light()
,
      debugShowCheckedModeBanner: false,
      home: const ListRandomPage(title: 'Random Sayı Uygulaması'),
    );
  }
}

class ListRandomPage extends StatefulWidget {
  const ListRandomPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListRandomPage> createState() => _ListRandomPageState();
}

class _ListRandomPageState extends State<ListRandomPage> {
  List<Map> liste = [];
 void _sil(int index) {
    setState(() {
      liste.removeAt(index);
    });
  }
  void _olustur() {
    setState(() {
      liste.clear();
      for (int i =  0; i < 10; i++) {
        int randomNumber = Random().nextInt(50); 
        liste.add(randomNumber as Map);
      }
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${liste[index]}',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => _sil(index),
                 
                );
              },
            ),
          ),

          Container(
           
            child: ElevatedButton(
             
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 0, 0)),
              child: const Text('liste oluştur '),
               onPressed: _olustur,
            ),
          ),
        
        ],
      ),
    );
  }
}