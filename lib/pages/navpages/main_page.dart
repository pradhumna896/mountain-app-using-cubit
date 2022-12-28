import 'package:flutter/material.dart';
import 'package:mountain_app/pages/navpages/bar_item_page.dart';
import 'package:mountain_app/pages/navpages/home_page.dart';
import 'package:mountain_app/pages/navpages/my_page.dart';
import 'package:mountain_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = <Widget>[
    const HomePage(),
    const BarPage(),
    const SearchPage(),
    const MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.person))
          ]),
    );
  }
}
