// import 'package:flutter/material.dart';

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 1.5,
//           ),
//           itemCount: 6,
//           itemBuilder: (context, index) {
//             return Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.category,
//                     size: 50,
//                     color: Colors.blue,
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Category ${index + 1}',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
