import 'package:flutter/material.dart';
import 'package:test_project/mcq_screen/category.dart';
import 'package:test_project/mcq_screen/mcq_screen.dart';

class CategoryScreen extends StatelessWidget {


  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                'Explore categories and test what you know about Islam.',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      InkWell(
                          onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(category: categories[i]['title']),
      ),
    );
  },
                        child: Container(
                            width: MediaQuery.sizeOf(context).width / 3.7,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12)),
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8)),
                                      color: Colors
                                          .accents[i % Colors.primaries.length]),
                                  child:
                                      Image.asset('assets/social/instagram.png'),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  categories[i]['title'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                      )
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
