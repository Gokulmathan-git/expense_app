import 'dart:convert';

import 'package:expense_app/controller/homeControl/controller.dart';
import 'package:expense_app/userStore/user_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  dynamic data;

  // getHttp() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Expense App"),
        actions: [
          IconButton.filled(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ${UserStore.to.profile.phoneNumber} ${UserStore.to.token}',
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
                    title: Text(data[index]['id']),
                    subtitle: Text(data[index]['phoneNumber']),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
