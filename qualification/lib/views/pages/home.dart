import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualification/utils/global.dart' as gb;
import 'package:qualification/views/pages/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qualification/views/pages/productList.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  void _onPressedProduct() {
    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) {
          return ProductListPage();
        }),
      );
    });
  }

  void _onPressedLogout() {
    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) {
          gb.username = "";
          return LoginPage();
        }),
      );
    });
  }

  var _images = ['assets/11.jpg', 'assets/12.jpg'];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: gb.darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return ['Toggle Theme'].map((e) {
                return PopupMenuItem(
                  child: TextButton(
                    child: Text('Change Theme'),
                    onPressed: () {
                      setState(() {
                        gb.darkThemeEnabled = !gb.darkThemeEnabled;
                      });
                    },
                  ),
                );
              }).toList();
            })
          ],
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),
            ListTile(
              title: TextButton(
                  onPressed: null,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${gb.username}',
                      style: TextStyle(
                        fontSize: 20,
                        foreground: Paint()
                          ..strokeWidth = 3
                          ..color = Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
            ),
            ListTile(
              title: TextButton(onPressed: null, child: Text('Home')),
            ),
            ListTile(
              title: TextButton(
                  onPressed: _onPressedProduct, child: Text('Product')),
            ),
            ListTile(
              title: TextButton(
                  onPressed: _onPressedLogout, child: Text('Logout')),
            ),
          ],
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Text(
                  'KRUSTY KRAB',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              CarouselSlider(
                  items: [
                    Image(image: AssetImage(_images[0])),
                    Image(image: AssetImage(_images[1])),
                    // Image(image: AssetImage(_images[2])),
                  ],
                  options: CarouselOptions(
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5))),
              Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Text(
                  'STARRING',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: Row(
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'assets/spongebob.png',
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(15),
                    ),
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'assets/patrick.png',
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Container(
                  color: Colors.black,
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 5),
                        child: Text("Contact Us",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..strokeWidth = 3
                                ..color = Colors.white,
                            )),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: Container(
                                child: Row(
                              children: [
                                Icon(Icons.email_outlined, color: Colors.white),
                                Text("lc031@mail.com",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..strokeWidth = 3
                                        ..color = Colors.white,
                                    )),
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: Container(
                                child: Row(
                              children: [
                                Icon(Icons.phone_android, color: Colors.white),
                                Text("lc031@mail.com",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..strokeWidth = 3
                                        ..color = Colors.white,
                                    )),
                              ],
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
