import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/extensions/string.dart';

import '../../core/utils/colors.dart';
import '../../widgets/app/favourite_card.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_button.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Favourite",
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: favouriteItems.length,
                itemBuilder: (context, index) {
                  final item = favouriteItems[index];
                  return FavouriteCard(
                    imagePath: item.imagePath,
                    title: item.name,
                    subtitle: item.size,
                    price: item.price,
                    onTap: () {
                      // Add functionality for card tap if needed
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.grey.withOpacity(0.5),
                  height: 48.height,
                ),
              ),
            ),
            SizedBox(height: 20.height),
            AppButton(
              title: 'Add All To Cart',
              onTap: () {
                // Add functionality for "Add All To Cart" button
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FavouriteItem {
  final String name;
  final String size;
  final String price;
  final String imagePath;

  FavouriteItem({
    required this.name,
    required this.size,
    required this.price,
    required this.imagePath,
  });
}

final List<FavouriteItem> favouriteItems = [
  FavouriteItem(
    name: 'Sprite Can',
    size: '325ml, Price',
    price: '1.50',
    imagePath: 'Sprite'.assetPNG,
  ),
  FavouriteItem(
    name: 'Diet Coke',
    size: '355ml, Price',
    price: '1.99',
    imagePath: 'Diet_Coke'.assetPNG,
  ),
  FavouriteItem(
    name: 'Apple & Grape Juice',
    size: '2L, Price',
    price: '15.50',
    imagePath: 'Apple'.assetPNG,
  ),
  FavouriteItem(
    name: 'Coca Cola Can',
    size: '325ml, Price',
    price: '4.99',
    imagePath: 'Coka'.assetPNG,
  ),
  FavouriteItem(
    name: 'Pepsi Can',
    size: '330ml, Price',
    price: '4.99',
    imagePath: 'Pepsi'.assetPNG,
  ),
];
