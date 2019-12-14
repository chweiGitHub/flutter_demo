import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart.dart';

class GoodsItem extends StatefulWidget {
  final GoodsInfo item;
  final Function addToShoppingCart;

  const GoodsItem({Key key, this.item, this.addToShoppingCart})
      : super(key: key);

  @override
  _GoodsItemState createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  GlobalKey _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Image.network(
            widget.item.image,
            width: 40,
            height: 40,
          ),
          Expanded(
            child: Container(
              child: Text(widget.item.name),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: GestureDetector(
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.red,
                key: _key,
                size: 30.0,
              ),
              onTap: () {
                RenderBox renderBox = _key.currentContext.findRenderObject();
                var offset = renderBox.localToGlobal(Offset(
                    renderBox.size.width * 0.5, renderBox.size.height * 0.5));
                if (widget.addToShoppingCart != null)
                  widget.addToShoppingCart(offset);
              },
            ),
          ),
        ],
      ),
    );
  }
}
