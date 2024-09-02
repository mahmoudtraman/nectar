import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar_app/core/extensions/num.dart';


import '../../core/utils/colors.dart';

import '../app_text.dart';
import 'product_detail.dart';


class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  static double get height => 260.height;
  static double get width => 180.width;
  static double get aspectRatio => width / height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => ProductDetailView(
              imageUrl: imageUrl,
              title: title,
              subtitle: subtitle,
              price: price,

            ),
          ),
        );
      },
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: 16.width,
          vertical: 16.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.height),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: title,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.font,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.height),
                  AppText(
                    title: subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.darkGrey,
                    fontSize: 14.font,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          title: price,
                          fontSize: 18.font,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          size: 20,
                          color: AppColors.white,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(16.radius),
        ),
      ),
    );
  }
}
