import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_cart/add_animation_container.dart';
import 'package:shopping_cart/goods_item.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List goodsList = [];
  GlobalKey spKey;

  Offset spOffset;
  Size spSize;
  Offset goodsOffset;
  Size goodsSize;
  bool isAnimationContainerShow = true;

  int count = 0;

  @override
  void initState() {
    super.initState();

    spKey = GlobalKey();

    for (var i = 0; i < 50; i++) {
      goodsList.add(
        GoodsInfo(
          1000 + i,
          '商品${i + 1}',
          image: 'https://upload.jianshu.io/users/upload_avatars/2070472/76bee25ac60f.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
        ),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox renderBox = spKey.currentContext.findRenderObject();

      spOffset = renderBox.localToGlobal(
          Offset(renderBox.size.width * 0.5, renderBox.size.height * 0.5));
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBarView = AppBar(
      title: Text('商品列表'),
    );

    double appBarHeight = appBarView.preferredSize.height;
    double topHeight =
        appBarHeight + MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
      appBar: appBarView,
      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
                children: goodsList.map((item) {
              return GoodsItem(
                item: item,
                addToShoppingCart: (o) {
                  count++;
                  setState(() {
                    goodsOffset = o;
                  });
                },
              );
            }).toList()),
          ),
          AddAnimationContainer(
            startOffset: goodsOffset,
            endOffset: spOffset,
            topHeight: topHeight,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: spKey,
        backgroundColor: Colors.red[100],
        child: Container(
          child: Text(
            count.toString(),
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class GoodsInfo {
  GoodsInfo(
    this.id,
    this.name, {
    this.price,
    this.image,
    this.description,
  });

  int id;
  String name;
  double price;
  String image;

  String description;

  @override
  String toString() {
    return "id: $id, name: $name";
  }
}
