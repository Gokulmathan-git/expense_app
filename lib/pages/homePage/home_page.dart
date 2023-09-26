import 'package:expense_app/controller/homeControl/controller.dart';
import 'package:expense_app/pages/homePage/form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'widget/grey_container.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd6d4ce),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: const Color(0xffd6d4ce),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Welcome, ',
                          style: TextStyle(
                              color: Color(0xff91908d),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Gokul !',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {
                          controller.logout();
                        },
                        icon: const Icon(
                          (Icons.logout),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Color(0xff91908d),
                endIndent: 20,
                indent: 20,
              ),
              if (!controller.connectionCheck())
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    child: const Center(
                      child: Text("No Connection"),
                    ),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      size: 25,
                    ),
                    Text(
                      "60000",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Balance",
                      style: TextStyle(
                        color: Color(0xff91908d),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GreyContainer(text: "Total Earnings", amount: "80000"),
                  GreyContainer(text: "Total Spend", amount: "20000"),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Text(
                      "Spending Details :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            "Today",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 300,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 55.0,
                          lineWidth: 8.0,
                          percent: 0.1,
                          center: const Text(
                            "30%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          progressColor: Colors.red,
                          backgroundColor: const Color(0xff343434),
                        ),
                        Text(
                          "All Expenses for today in details",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: 170,
                    child: Column(children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffe63c3a),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: const Color(0xffd6d4ce),
        color: const Color(0xffd6d4ce),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                height: 90,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    controller.icon.length,
                    (index) => controller.state.currentIndex ==
                            controller.icon[index]['pos']
                        ? Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffd6d4ce),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: navigationIcon(
                                controller.icon[index]['icon'],
                                controller.icon[index]['name'],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              controller.state.currentIndex.value = index + 1;
                              print("object $index");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                controller.icon[index]['icon'],
                                color: Color(0xffd6d4ce),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FormPage(),
                  ),
                );
              },
              backgroundColor: Colors.black,
              child: const Icon(
                Icons.add,
                color: Color(0xffd6d4ce),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row navigationIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
