import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hackafront/account_list.dart';
import 'package:hackafront/account_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 3, 76, 136)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LCL Visionnaire'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<dynamic> future = Future.value(null);

  void update(String account) {
    var result = http.get(Uri.parse('http://127.0.0.1:8090/predict?clientId=$account'))
        .then((value) => jsonDecode(value.body));

    setState(() {
      future = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(flex: 1, child: FutureBuilder(
            future: http.get(Uri.parse('http://127.0.0.1:8090/clients'))
                    .then((value) => jsonDecode(value.body)),
            builder: (context, snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Container();
              }
              
              return AccountList(snapshot.data, (account) => update(account));
            },
          )),
          Container(color: Colors.black, width: 1,),
          Expanded(flex: 3, child: FutureBuilder(
            future: future, 
            builder: (context, snapshot) {
              if (snapshot.hasError || snapshot.data == null) {
                return Container();
              }
              
              return AccountViewer(map: snapshot.data!);
            },
          ))
        ],
      ),
      floatingActionButton: null
    );
  }
}
