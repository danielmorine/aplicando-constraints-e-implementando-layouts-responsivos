import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';

import '../components/food_item.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List items = destaques;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Menu",
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: items.length,
              (context, index) {
                return FoodItem(
                  imageURI: items[index]["image"],
                  itemPrice: items[index]["price"],
                  itemTitle: items[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
