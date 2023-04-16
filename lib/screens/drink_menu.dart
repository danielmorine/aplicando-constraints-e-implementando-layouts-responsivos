import 'package:flutter/material.dart';

import '../cardapio.dart';
import '../components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  final List items = drinks;
  const DrinkMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Bebidas',
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(childCount: items.length,
                (context, index) {
              return DrinkItem(
                imageURI: items[index]["image"],
                itemPrice: items[index]["price"],
                itemTitle: items[index]["name"],
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 3
                      : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1.2
                      : 158 / 194,
            ),
          ),
        ],
      ),
    );
  }
}
