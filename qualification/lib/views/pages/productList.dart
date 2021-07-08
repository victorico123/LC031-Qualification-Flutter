import 'package:flutter/material.dart';
import 'package:qualification/models/product.dart';
import 'package:qualification/views/pages/home.dart';
import 'package:qualification/views/pages/login.dart';
import 'package:qualification/utils/global.dart' as gb;
import 'package:qualification/views/pages/productDetail.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductListPage> {
  var _ctx = null;
  var _data = [
    Product(1, '1.jpg', 'Krabby Patties', 500),
    Product(2, '2.jpg', 'Chum Patties', 1),
    Product(3, '3.jpg', 'Chum Bucket', 69),
    Product(4, '4.jpg', 'Rusty on Rye', 50),
  ];

  void _onPressed(Product l) {
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return ProductDetailPage(l.img, l.name, l.price, l.id);
    }));
  }

  void _onPressedHome() {
    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) {
          return HomePage();
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

  Widget _buildWidget(Product l) {
    print(l.price);
    return Container(
      height: 250,
      child: Card(
          child: Container(
              child: Row(
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 200,
                minWidth: 200,
                maxHeight: 200,
                maxWidth: 200,
              ),
              child: Image.asset(
                'assets/${l.img}',
                fit: BoxFit.cover,
              )),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200,
              minWidth: 200,
              maxHeight: 200,
              maxWidth: 200,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${l.name}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('\$${l.price}'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                        onPressed: () => _onPressed(l),
                        child: Text('Details'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Theme(
      data: gb.darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Products'),
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
                title:
                    TextButton(onPressed: _onPressedHome, child: Text('Home')),
              ),
              ListTile(
                title: TextButton(onPressed: null, child: Text('Product')),
              ),
              ListTile(
                title: TextButton(
                    onPressed: _onPressedLogout, child: Text('Logout')),
              ),
            ],
          )),
          body: ListView(children: _data.map((e) => _buildWidget(e)).toList())),
    );
  }
}
