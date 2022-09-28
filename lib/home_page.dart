import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String calcuFl = 'cc';
  int count = 0;
  String dob = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2A2D36),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height / 15,
                    child: Text(
                      calcuFl,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            Container(
              height: size.height / 1.7,
              decoration: const BoxDecoration(
                  color: Color(0xff2A2D36),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("AC", Colors.green),
                    blocks("CC", Colors.green),
                    blocks("%", Colors.green),
                    blocks("/", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("1"),
                    blocks("2"),
                    blocks("3"),
                    blocks("x", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("4"),
                    blocks("5"),
                    blocks("6"),
                    blocks("+", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("7"),
                    blocks("8"),
                    blocks("9"),
                    blocks("-", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks(":"),
                    blocks("0"),
                    blocks("."),
                    blocks("=", count == 0 ? Colors.red : Colors.green),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget blocks(String text, [Color? colo]) {
    return GestureDetector(
      onTap: () {
        if (text == "AC") {
          setState(() {
            calcuFl = "";
          });
        } else if (text == "=") {
          if (count == 0) {
            setState(() {
              dob = calcuFl;
              count += 1;
              calcuFl = "";
            });
          } else {
            setState(() {
              calcuFl = dob;
              count -= 1;
              dob = "";
            });
          }
        } else {
          setState(() {
            calcuFl = calcuFl + text;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 8, right: 8),
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
              color: Color(0xff22252D),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: colo ?? Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
