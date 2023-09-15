import 'dart:convert';

import 'package:expense_app/controller/signInControl/controller.dart';
import 'package:expense_app/pages/signInPage/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  Get.put<SignInController>(SignInController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffd6d4ce),
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            background: Color(0xffd6d4ce),
            error: Colors.red,
            onError: Colors.white,
            onBackground: Colors.black,
            surface: Color(0xffFFFBFE),
            onSurface: Color(0xff1C1B1F),
            primary: Color(0xffe63c3a),
            onPrimary: Colors.white,
            secondary: Color(0xff91908d),
            onSecondary: Colors.black),
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  dynamic data;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  getHttp() async {
    print('inside');
    String url = 'https://api-for-check.vercel.app/readAll';
    int token = 55;
    // var response =
    //     await http.get(Uri.parse(url));

    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var items = json.decode(response.body);

      setState(() {
        data = items['data'];
      });

      print(data);
    } else {
      print("error in api");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        data[index]['id'],
                      ),
                    ),
                    title: Text(data[index]['name']),
                    subtitle: Text(data[index]['lastname']),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
