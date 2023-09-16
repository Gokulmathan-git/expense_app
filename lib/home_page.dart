import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final List<Widget> _list = [
    Column(
      children: [
        const Divider(
          color: Color(0xff91908d),
          endIndent: 20,
          indent: 20,
        ),
        Container(
          color: Colors.amber,
          height: double.infinity,
          width: 500,
          child: const Row(
            children: [
              Icon(Icons.currency_rupee),
              Text(
                "60000",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Balance",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        )
      ],
    ),
    const Column(
      children: [
        Divider(
          color: Colors.amber,
          endIndent: 20,
          indent: 20,
        ),
      ],
    ),
    const Column(
      children: [
        Divider(
          color: Colors.red,
          endIndent: 20,
          indent: 20,
        ),
      ],
    )
  ];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6d4ce),
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: Color(0xffd6d4ce),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
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
            ),
            const Divider(
              color: Color(0xff91908d),
              endIndent: 20,
              indent: 20,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                greyContainer("Total Earnings", "80000"),
                greyContainer("Total Spend", "20000"),
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
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Color(0xffd6d4ce),
        color: Color(0xffd6d4ce),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              height: 90,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  icon.length,
                  (index) => currentIndex == icon[index]['pos']
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
                              icon[index]['icon'],
                              icon[index]['name'],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index + 1;
                            });
                            print("object $index");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              icon[index]['icon'],
                              color: Color(0xffd6d4ce),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {},
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

  Container greyContainer(String text, String amount) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff91908d),
      ),
      height: 100,
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(
                  Icons.currency_rupee,
                ),
                Text(
                  "$amount /-",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
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
