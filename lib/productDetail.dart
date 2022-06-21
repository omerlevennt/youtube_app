import 'package:flutter/material.dart';
import 'package:youtube_app/components/bottomNavigaton.dart';
import 'components/header.dart';
import 'components/label.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color selectedColor;
  int selectedCapacity = 64;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFD5D8C0)
  ];
  List<int> capacities = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: <Widget>[
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //header
                header(widget.productTitle, context),
                SizedBox(
                  height: 32,
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //New etiketi
                        label("New"),
                        SizedBox(
                          height: 25,
                        ),
                        //Ürün Fotoğrafı
                        Center(
                            child: Image.asset(
                          "assets/images/iphone.jpg",
                          height: 200,
                        )),

                        SizedBox(
                          height: 30,
                        ),

                        //Renk seçenekleri
                        Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0A1034)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: colors
                              .map((Color color) => colorOption(
                                  color: color,
                                  selected: selectedColor == color,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = color;
                                    });
                                  }))
                              .toList(),
                        ),

                        //Katasite seçenekleri
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Capacity",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0A1034)),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: capacities
                              .map((int number) => capacityOption(
                                  capacity: number,
                                  selected: selectedCapacity == number,
                                  onTap: () {
                                    setState(() {
                                      selectedCapacity = number;
                                    });
                                  }))
                              .toList(),
                        ),
                        SizedBox(
                          height: 32,
                        ),

                        //Sepete ekle butonu
                        GestureDetector(
                          onTap: (){

                            print("Ürün sepete eklendi.");
                            print("Ürün ismi: "+widget.productTitle);
                            print("Ürünün rengi: "+selectedColor.value.toString());
                            print("Ürün kapaitesi: "+selectedCapacity.toString()+ " gb");
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xFF1F53E4)),
                            child: Text(
                              "Add to cart",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),

                        SizedBox(height: 100,),
                      ],
                    ),
                  ),
                )
              ])),
              bottomNavigatonsBar("search"),
    ])));
  }
}

Widget colorOption({Color color, bool selected, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: Color(0xFF0001FC), width: selected ? 4 : 0),
      ),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption({int capacity, bool selected, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("$capacity gb ",
            style: TextStyle(
                color: Color(selected ? 0xFF0001FC : 0xFFA7A98E),
                fontSize: 16))),
  );
}
