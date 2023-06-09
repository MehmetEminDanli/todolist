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
      title: 'todolist',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const ListRandomPage(title: 'Random Todolist uygulaması'),
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
  List<int> todolist = [];
  List<bool> _tikli = [];

  void _sil(int index) {
    setState(() {
      todolist.removeAt(index);
      _tikli.removeAt(index);
    });
  }

  void _olustur() {
    setState(() {
     
      _tikli.clear();
      for (int i = 0; i < 10; i++) {
        int randomNumber = Random().nextInt(50);
        todolist.add(randomNumber);
        _tikli.add(false);
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
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 2,
              ),
              itemCount: todolist.length,
              itemBuilder: (context, index) {
                var element = todolist[index];
                return ListTile(
                  leading: Checkbox(
                    onChanged: (x) {
                      setState(() {
                        _tikli[index] = x!;
                      });
                    },
                    value: _tikli[index],
                    checkColor: Colors.deepOrangeAccent,
                    activeColor: Colors.red,
                  ),
                  title: Text(
                    element.toString(),
                    style: TextStyle(
                      color: _tikli[index] ? Colors.green : Colors.red,
                    ),
                  ),
                  subtitle: const Text("bla bla"),
                  
                  trailing: InkWell(
                    onTap: () => _sil(index),
                    child: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          Container(
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 0, 0)),
              child: const Text('todolist oluştur '),
              onPressed: _olustur,
            ),
          ),
        ],
      ),
    );
  }
}