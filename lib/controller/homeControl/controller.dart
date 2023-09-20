import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../userStore/user_store.dart';
import 'state.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final appBartitle = "Expense App";

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  logout() {
    UserStore.to.logout();
  }
}
