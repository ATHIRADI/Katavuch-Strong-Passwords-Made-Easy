// import 'package:flutter/material.dart';
// import 'package:katavuch/pages/pages.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final PageController pageController = PageController(initialPage: 0);
//     late int selectedIndex = 0;

//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.blue,
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.black,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//             pageController.jumpToPage(index);
//           });
//         },
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.lock),
//             label: 'Passwords',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.save),
//             label: 'Saved',
//           ),
//         ],
//       ),
//       body: PageView(
//         controller: pageController,
//         children: const <Widget>[
//           Center(
//             child: GenerateScreen(),
//           ),
//           Center(
//             child: PasswordListScreen(),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:katavuch/pages/pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  List pages = [
    const GenerateScreen(),
    const PasswordListScreen(),
  ];

  changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (index) => changeTab(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Passwords',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Saved',
          ),
        ],
      ),
      body: pages[selectedTab],
    );
  }
}
