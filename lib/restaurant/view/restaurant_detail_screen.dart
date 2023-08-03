import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_dard.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;
  const RestaurantDetailScreen({required this.id, super.key});

  Future getRestaurantDetail() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final resp = await dio.get(
      'http://$ip/restaurant/$id',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'asd',
      child: FutureBuilder(
        future: getRestaurantDetail(),
        builder: (_, snapshot) {
          print(snapshot.data);
          return CustomScrollView(
            slivers: [
              renderTop(),
              renderLabel(),
              renderProducts(),
            ],
          );
        },
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ProductCard(),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
      child: RestaurantCard(
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
    );
  }
}
