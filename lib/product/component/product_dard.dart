import 'package:flutter/material.dart';
import 'package:actual/common/const/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // 내부 widget 중 최대 height 맞추기
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'name',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'name: model.name, tags: model.tags, ratingsCount: model.ratingsCount, deliveryTime: model.deliveryTime, deliveryFee: model.deliveryFee, ratings: model.ratings, isDetail: isDetail,',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: BODY_TEXT_COLOR,
                  fontSize: 14.0,
                ),
              ),
              Text(
                '￦price',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
