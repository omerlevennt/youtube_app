import 'package:flutter/material.dart';
import 'package:youtube_app/components/bottomNavigaton.dart';
import 'categories.dart';
import 'components/label.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: <Widget>[
                  //BAŞLIK
                  buildBaslik(),

                  //BANNER
                  buildBanner(),

                  //BUTONLAR
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //ilk eleman
                        buildNavigation(text: "Categories", icon: Icons.menu,widget: CategoriesPage(),context: context),
                        buildNavigation(
                            text: "Favorites", icon: Icons.star_border),
                        buildNavigation(
                            text: "Gifts", icon: Icons.card_giftcard),
                        buildNavigation(
                            text: "Best selling", icon: Icons.people),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),

                  //SALES TİTLE
                  Text(
                    "Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034)),
                  ),
                  SizedBox(height: 16),

                  //SALES İTEMS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSalesItem(
                          text: "Smartphones",
                          photoUrl: "assets/images/iphone.jpg",
                          discount: "-50%",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Monitors",
                          photoUrl: "assets/images/monitor.jpg",
                          discount: "-50%",
                          screenWidth: screenWidth),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSalesItem(
                          text: "Smartphones",
                          photoUrl: "assets/images/ipad.png",
                          discount: "-50%",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Monitors",
                          photoUrl: "assets/images/macbook.png",
                          discount: "-50%",
                          screenWidth: screenWidth),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSalesItem(
                          text: "Smartphones",
                          photoUrl: "assets/images/iphone.jpg",
                          discount: "-50%",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Monitors",
                          photoUrl: "assets/images/monitor.jpg",
                          discount: "-50%",
                          screenWidth: screenWidth),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSalesItem(
                          text: "Smartphones",
                          photoUrl: "assets/images/ipad.png",
                          discount: "-50%",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Monitors",
                          photoUrl: "assets/images/macbook.png",
                          discount: "-50%",
                          screenWidth: screenWidth),
                    ],
                  ),
                  SizedBox(height: 100,),


                ],
              ),
            ),

            //BOTTOM NAVIGATION BAR
            bottomNavigatonsBar("home")
          ],
        ),
      ),
    );
  }
}



Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Bose Home Speaker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text("USD 279",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Image.asset(
            "assets/images/speaker.jpg",
            width: 115,
          ),
        ],
      ),
    ),
  );
}

Widget buildNavigation(
    {@required String text,
    @required IconData icon,
    Widget widget,
    BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF1F53E4),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildSalesItem(
    {@required String text,
    @required String photoUrl,
    @required String discount,
    @required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        label(discount),
        SizedBox(height: 22),
        Image.asset(photoUrl, width: 200,height: 90),
        SizedBox(height: 22),
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}
