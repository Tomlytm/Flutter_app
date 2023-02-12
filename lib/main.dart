import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum Sky { ngn, usd, eur, gbp }

void main() => runApp(const SegmentedControlApp());

class SegmentedControlApp extends StatelessWidget {
  const SegmentedControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: CupertinoThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      home: SegmentedControlExample(),
    );
  }
}

class SegmentedControlExample extends StatefulWidget {
  const SegmentedControlExample({super.key});

  @override
  State<SegmentedControlExample> createState() =>
      _SegmentedControlExampleState();
}

class _SegmentedControlExampleState extends State<SegmentedControlExample> {
  Sky _selectedSegment = Sky.ngn;
  bool showBalance = true;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: currentIndex == 0
          ? AppBar(
              backgroundColor: Color.fromARGB(255, 32, 32, 32),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/bg.jpg',
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    'Hello, Tomilayo',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              // leadingWidth: 200,
              // centerTitle: true,
            )
          : AppBar(
              backgroundColor: Color.fromARGB(255, 17, 16, 16),
              title: const Center(child: Text('Payments'))
              // leadingWidth: 200,
              // centerTitle: true,
              ),
      body: currentIndex == 0
          ? Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 41, 41, 41),
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: CupertinoSlidingSegmentedControl<Sky>(
                                backgroundColor:
                                    Color.fromARGB(255, 133, 133, 137),
                                thumbColor: Color.fromARGB(255, 32, 32, 32),
                                // This represents the currently selected segmented control.
                                groupValue: _selectedSegment,
                                // Callback that sets the selected segmented control.
                                onValueChanged: (Sky? value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedSegment = value;
                                    });
                                  }
                                },
                                children: const <Sky, Widget>{
                                  Sky.ngn: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'NGN',
                                      style: TextStyle(
                                          color: CupertinoColors.white),
                                    ),
                                  ),
                                  Sky.eur: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'EUR',
                                      style: TextStyle(
                                          color: CupertinoColors.white),
                                    ),
                                  ),
                                  Sky.usd: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'USD',
                                      style: TextStyle(
                                          color: CupertinoColors.white),
                                    ),
                                  ),
                                  Sky.gbp: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'GBP',
                                      style: TextStyle(
                                          color: CupertinoColors.white),
                                    ),
                                  ),
                                },
                              ),
                            ),
                          ]),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 12, 0, 0),
                            child: SizedBox(
                              child: Text(
                                'Account balance',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          showBalance
                              ? _selectedSegment.name == 'ngn'
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '₦ 2,506.10',
                                        style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  : _selectedSegment.name == 'usd'
                                      ? const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            '\$ 506.80',
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        )
                                      : _selectedSegment.name == 'eur'
                                          ? const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '€ 26,506.50',
                                                style: TextStyle(
                                                    fontSize: 32,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '£ 506.10',
                                                style: TextStyle(
                                                    fontSize: 32,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            )
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '********',
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  )),
                          showBalance
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showBalance = !showBalance;
                                    });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(4.0, 0, 0, 8.0),
                                    child: Icon(Icons.remove_red_eye,
                                        color: Colors.white),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showBalance = !showBalance;
                                    });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(4.0, 0, 0, 8.0),
                                    child: Icon(Icons.visibility_off,
                                        color: Colors.white),
                                  ),
                                ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 28, 28, 28)),
                              child: const Text('ADD MONEY'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('EXCHANGE'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 28, 28, 28)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('SEND MONEY'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 28, 28, 28)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: const SizedBox(
                          child: Text(
                            'Latest Transaction',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: ListView(
                              children: const [
                                ListTile(
                                  leading: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Tomilayo Jesse',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: Text(
                                    '-₦22,000.00',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    '11:00am',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  tileColor: Color.fromARGB(255, 85, 84, 83),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: ListView(
                              children: const [
                                ListTile(
                                  leading: Icon(
                                    Icons.install_mobile,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Tomilayo Jesse',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: Text(
                                    '-₦22,000.00',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    '11:00am',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  tileColor: Color.fromARGB(255, 85, 84, 83),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: const SizedBox(
                          child: Text(
                            '24, October 2022',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                ListTile(
                                  leading: Icon(
                                    Icons.card_giftcard,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Tomilayo Jesse',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: Text(
                                    '-₦22,000.00',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    '11:00am',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  tileColor: Color.fromARGB(255, 85, 84, 83),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Send Money',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Free transfers to all banks',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              tileColor: Color.fromARGB(255, 85, 84, 83),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.install_mobile_rounded,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Buy Airtime',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Recharge any phone easily',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              tileColor: Color.fromARGB(255, 85, 84, 83),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.money,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Pay Bills',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Take care of your essentials',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              tileColor: Color.fromARGB(255, 85, 84, 83),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.card_giftcard,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Gift Cards',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Shop around the world online',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              tileColor: Color.fromARGB(255, 85, 84, 83),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.public,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Web payments',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Pay online without your card',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              tileColor: Color.fromARGB(255, 85, 84, 83),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.credit_card,
                                color: Colors.white,
                              ),
                              title: Text(
                                'ATM & POS Payments',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Pay on a POS without your card',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              tileColor: Color.fromARGB(255, 85, 84, 83),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 50, 50, 50),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Payments',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
