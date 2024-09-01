import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';


class FavouriteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onTap;

  const FavouriteCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 70.height,
            width: 70.width,
          ),
          SizedBox(width: 20.width),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.height),
                AppText(
                  title: subtitle,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  AppText(
                    title: price,
                    fontSize: 16.font,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 8.width),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
