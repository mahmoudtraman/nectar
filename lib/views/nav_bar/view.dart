import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/extensions/string.dart';
import '../../core/utils/colors.dart';
import '../../widgets/app_text.dart';
import '../account/view.dart';
import '../cart/view.dart';
import '../explore/view.dart';
import '../favourite/view.dart';
import '../home/view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeView(),
        ExploreView(),
        CartView(),
        FavouriteView(),
        AccountView(),
      ][currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _tab(
                title: 'Shop',
                image: "home",
                index: 0,
              ),
              _tab(
                title: 'Explore',
                image: "explore",
                index: 1,
              ),
              _tab(
                title: 'Cart',
                image: "cart",
                index: 2,
              ),
              _tab(
                title: 'Favourite',
                image: "heart",
                index: 3,
              ),
              _tab(
                title: 'Account',
                image: "person",
                index: 4,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.2),
              offset: Offset(0, -12),
              blurRadius: 38,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tab({
    required String image,
    required String title,
    required int index,
  }) {
    final isSelected =  currentIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => currentIndex = index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image.assetPNG,
              height: 24.height,
              width: 28.height,
              color: isSelected ? AppColors.primary : AppColors.black,
            ),
            SizedBox(height: 6.height),
            AppText(
              title: title,
              color: isSelected ? AppColors.primary : AppColors.black,
              fontSize: 12.font,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
