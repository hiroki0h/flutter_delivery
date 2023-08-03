import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'asd',
        child: Column(
          children: [
            RestaurantCard(
              image: Image.asset(
                'asset/img/food/ddeok_bok_gi.jpg',
              ),
              name: 'name',
              tags: const ['tags', 'tags', 'tags'],
              ratingsCount: 1,
              deliveryTime: 2,
              deliveryFee: 3,
              ratings: 4,
              isDetail: true,
              detail: 'aaaa',
            ),
          ],
        ));
  }
}
