// import 'package:flutter/material.dart';
// import 'package:test_project/advance_bottom_nav/category.dart';

// import 'package:test_project/advance_bottom_nav/profile.dart';
// import 'home_screen.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   BottomNavState createState() => BottomNavState();
// }

// class BottomNavState extends State<BottomNav> {
//   int selectedIndex = 0;

//   void onItemTaped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   void switchToCategoryTab() {
//     setState(() {
//       selectedIndex = 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: selectedIndex == 0
//           ? HomeScreen(onSeeAllPressed: switchToCategoryTab)
//           : selectedIndex == 1
//               ? CategoryScreen()
//               : ProfileScreen(),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: onItemTaped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
