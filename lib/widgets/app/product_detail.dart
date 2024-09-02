import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/utils/colors.dart';
import '../app_text.dart';
import '../app_carousel.dart';

class ProductDetailView extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const ProductDetailView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.upload,
              size: 24,
              color: AppColors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AppCarousel(
              images: [
                widget.imageUrl,
                'https://png.pngtree.com/png-vector/20231015/ourmid/pngtree-red-apples-png-png-image_10163259.png',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR4tt_6INhZe9zsw7zXesXNdJs8Oo0CXiaBg&s',
              ],
              width: double.infinity,
              height: 370,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            SizedBox(height: 20.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Naturel Red Apple',
                  fontSize: 22.font,
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  FontAwesomeIcons.heart,
                  size: 24,
                  color: AppColors.primary,
                ),
              ],
            ),
            SizedBox(height: 8.height),
            AppText(
              title: widget.subtitle,
              fontSize: 16.font,
              color: AppColors.darkGrey,
            ),
            SizedBox(height: 16.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _CounterButton(
                      icon: FontAwesomeIcons.minus,
                      iconColor: AppColors.grey,
                      onTap: () {},
                    ),
                    AppText(
                      title: '1',
                      fontSize: 18.font,
                      fontWeight: FontWeight.bold,
                      padding: EdgeInsets.symmetric(horizontal: 16.width),
                    ),
                    _CounterButton(
                      icon: FontAwesomeIcons.plus,
                      iconColor: AppColors.primary,
                      onTap: () {},
                    ),
                  ],
                ),
                AppText(
                  title: widget.price,
                  fontSize: 22.font,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 20.height),
            Row(
              children: [
                AppText(
                  title: 'Product Detail',
                  fontSize: 18.font,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isDescriptionExpanded = !_isDescriptionExpanded;
                    });
                  },
                  child: Icon(
                    _isDescriptionExpanded
                        ? FontAwesomeIcons.chevronUp
                        : FontAwesomeIcons.chevronDown,
                    size: 16,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.height),
            if (_isDescriptionExpanded)
              AppText(
                title: 'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.',
                fontSize: 16.font,
                color: AppColors.darkGrey,
              ),
            SizedBox(height: 20.height),
            Row(
              children: [
                AppText(
                  title: 'Nutritions',
                  fontSize: 18.font,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12.radius),
                  ),
                  child: Row(
                    children: [
                      AppText(
                        title: '100gr',
                        fontSize: 16.font,
                        color: AppColors.grey,
                      ),
                      SizedBox(width: 8.width),
                    ],
                  ),
                ),
                SizedBox(width: 8.width),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: AppColors.black,
                ),
              ],
            ),
            SizedBox(height: 8.height),
            Row(
              children: [
                AppText(
                  title: 'Review',
                  fontSize: 18.font,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(Icons.star, color: Colors.red, size: 20);
                  }),
                ),
                SizedBox(width: 8.width),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: AppColors.black,
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.height),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.radius),
                  ),
                  backgroundColor: AppColors.primary,
                ),
                child: AppText(
                  title: 'Add To Basket',
                  fontSize: 18.font,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.radius),
      onTap: onTap,
      child: Container(
        width: 44.width,
        height: 44.height,
        child: Icon(
          icon,
          color: iconColor,
          size: 20.height,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.radius),
          border: Border.all(
            color: AppColors.grey.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
