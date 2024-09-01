import 'package:flutter/material.dart';

import 'package:nectar_app/core/extensions/num.dart';

import '../../core/route_utils/route_utils.dart';
import '../../core/utils/colors.dart';
import '../../views/category_details/view.dart';
import '../app_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  static double get height => 200.height;
  static double get width => 180.width;
  static double get aspectRatio => width / height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => RouteUtils.push(context, CategoryDetailsView()),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: 32.width,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/025/277/368/small/vegetables-basket-png.png',
              height: 92.height,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.height),
            AppText(
              title: 'Vegetables',
              fontWeight: FontWeight.w600,
              fontSize: 16.font,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primary.withOpacity(0.2),
          border: Border.all(color: AppColors.primary),
        ),
      ),
    );
  }
}
