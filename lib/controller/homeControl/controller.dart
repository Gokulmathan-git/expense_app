import 'package:expense_app/userStore/controller/connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../userStore/user_store.dart';
import 'state.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final appBartitle = "Expense App";
  final ConnectionManagerController _controller =
      Get.find<ConnectionManagerController>();

  List icon = [
    {
      "icon": Icons.home_outlined,
      "name": "Home",
      "pos": 1,
    },
    {
      "icon": Icons.bar_chart,
      "name": "Statics",
      "pos": 2,
    },
    {
      "icon": Icons.person_2_outlined,
      "name": "Profile",
      "pos": 3,
    }
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  bool connectionCheck() {
    if (_controller.connectionType.value == 0) {
      return false;
    }
    return true;
  }

  logout() {
    UserStore.to.logout();
  }
}
