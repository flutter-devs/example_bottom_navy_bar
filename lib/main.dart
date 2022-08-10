import 'package:example_bottom_navy_bar/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

class MyBottomNavyBar extends StatefulWidget {
  const MyBottomNavyBar({Key? key}) : super(key: key);

  @override
  BottomNavyBarState createState() => BottomNavyBarState();
}

class BottomNavyBarState extends State<MyBottomNavyBar> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text("Bottom Navy Bar"),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(
              child: Image.asset(
                'assets/1.jpeg',
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Image.asset(
                'assets/2.jpeg',
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Center(
              child: Image.asset(
                'assets/3.jpeg',
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Image.asset(
                'assets/4.jpeg',
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 55.0,
        backgroundColor: Colors.white70,
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.search_outlined),
            title: const Text('Search'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.settings),
            title: const Text(
              'Settings ',
            ),
            activeColor: Colors.yellow,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: const Icon(Icons.account_box),
            title: const Text('Account'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
