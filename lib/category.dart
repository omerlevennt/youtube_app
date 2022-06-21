import 'package:flutter/material.dart';
import 'package:youtube_app/components/bottomNavigaton.dart';
import 'package:youtube_app/components/header.dart';
import 'package:youtube_app/productDetail.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  List<Map> produsts = [
    {
      "isim": "Surface laptop 3",
      "fotograf": "assets/images/macbook.png",
      "fiyat": "999"
    },
    {
      "isim": "İphone 11 Pro ",
      "fotograf": "assets/images/macbook.png",
      "fiyat": "999"
    },
    {
      "isim": "Macbook",
      "fotograf": "assets/images/macbook.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 6",
      "fotograf": "assets/images/macbook.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 7",
      "fotograf": "assets/images/macbook.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/macbook.png",
      "fiyat": "999"
    }
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
              //header
              header(categoryTitle, context),
              SizedBox(
                height: 32,
              ),

              //içerikler
             Expanded(child:  GridView.count(
               crossAxisSpacing: 10,
               mainAxisSpacing: 15,
               crossAxisCount: 2,
               children: produsts.map((Map product) {
                 return buildContent(
                     product["isim"], product["fotograf"], product["fiyat"],context);
               }).toList(),
             ),),
              SizedBox(height: 60,),

            ],
          )),

              //bottom navigation
              bottomNavigatonsBar("search"),

    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price,context) {
  return GestureDetector(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 24,
                offset: Offset(0, 16))
          ]),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Image.asset(photoUrl, width: 150),
          SizedBox(
            height: 9,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Color(0XFF3A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "USD $price",
                style: TextStyle(
                    color: Color(0XFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16,)
            ],
          ),
        ],
      ),
    ),
  );
}
