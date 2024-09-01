import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/extensions/string.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app/product_card.dart';
import '../../widgets/app_app_bar.dart';
import '../filter/view.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Vegetables",
        trailing: IconButton(
          icon: Image.asset(
            'filter'.assetPNG,
            width: 20.width,
            height: 20.height,
          ),
          onPressed: () => RouteUtils.push(context, FilterView()),
        ), centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 7,
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: ProductCard.aspectRatio,
        ),
        itemBuilder: (context, index) {
          return ProductCard(imageUrl: '', title: '', price: '', subtitle: '',);
        },
      ),
    );
  }
}
