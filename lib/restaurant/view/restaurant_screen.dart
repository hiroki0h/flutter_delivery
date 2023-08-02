import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RestaurantCard(
                image: Image.asset(
                  'asset/img/food/ddeok_bok_gi.jpg',
                  fit: BoxFit.cover, // 이미지 전체
                ),
                name: 'ddeok_bok_gi',
                tags: const ['aaa', 'bbb', 'ccc'],
                ratingsCount: 100,
                deliveryTime: 15,
                deliveryFee: 2000,
                ratings: 4.52)),
      ),
    );
  }
}
