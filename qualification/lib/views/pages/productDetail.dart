import 'package:flutter/material.dart';
import 'package:qualification/models/review.dart';
import 'package:qualification/utils/global.dart' as gb;

class ProductDetailPage extends StatefulWidget {
  String img;
  String name;
  int price;
  int itemId;

  ProductDetailPage(this.img, this.name, this.price, this.itemId);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailPageState();
  }
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var _ctrlComment = TextEditingController();
  var _secondTab;
  var _currentCommentData = [];

  void _onPressed(BuildContext ctx) {
    if (_ctrlComment.text == "") {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text('Comment must be filled!')));
    } else {
      setState(() {
        Review newReview =
            Review(widget.itemId, gb.username, _ctrlComment.text);
        gb.commentData.add(newReview);
        ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(content: Text('Comment successfully added!')));
        _ctrlComment.clear();
        _refresh();
      });
    }
  }

  void initComment() {
    for (var i = 0; i < gb.commentData.length; i++) {
      if (gb.commentData[i].itemId == widget.itemId) {
        _currentCommentData.add(gb.commentData[i]);
      }
    }
  }

  void _refresh() {
    if (_currentCommentData.length == 0) {
      this._secondTab = Center(child: Text("No comment yet!"));
    } else {
      this._secondTab = ListView(
          children: _currentCommentData
              .map<Widget>((r) => _buildComment(r))
              .toList());
    }
  }

  Widget _buildComment(Review r) {
    return Card(
        child: Column(
      children: [
        Text(
          '${r.username}',
          style: TextStyle(
            fontSize: 20,
            foreground: Paint()
              ..strokeWidth = 3
              ..color = Colors.blue.shade300,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${r.comment}',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    initComment();
    _refresh();
    return Theme(
      data: gb.darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                  bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.add_comment)),
                Tab(icon: Icon(Icons.comment)),
              ])),
              body: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 200,
                              minWidth: 200,
                              maxHeight: 200,
                              maxWidth: 200,
                            ),
                            child: Image.asset(
                              'assets/${widget.img}',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                '${widget.name}',
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                '\$${widget.price}',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Leave a Comment Below',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Comment',
                            ),
                            controller: _ctrlComment,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: ElevatedButton(
                            onPressed: () => _onPressed(context),
                            child: Text('Post Comment'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                            )),
                      )
                    ],
                  ),
                ),
                _secondTab,
              ]))),
    );
    //     body: Column(
    //   children: [
    //     Image(image: AssetImage('assets/${widget.img}')),
    //     Text(widget.name)
    //   ],
    // )));
  }
}
