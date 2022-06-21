import 'package:flutter/material.dart';
import 'package:youtube_app/category.dart';
import 'package:youtube_app/components/bottomNavigaton.dart';
import 'package:youtube_app/components/header.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smart phones",
    "Smart object",
    "Speakers",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: <Widget>[
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               header("Categories", context),

                SizedBox(
                  height: 16,
                ),

                //kategoriler
                Expanded(
                  child: ListView(
                    children: categories
                        .map((String title) => buildCategory(title,context))
                        .toList(),
                  ),
                ),
                SizedBox(height: 50,),

              ])),
              bottomNavigatonsBar("search"),
    ])));
  }
}

Widget buildCategory(String title, context,) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF0A1034)),
      ),
    ),
  );
}
