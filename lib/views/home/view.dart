import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/extensions/string.dart';
import '../../core/utils/colors.dart';
import '../../widgets/app/product_card.dart';
import '../../widgets/app/section_title.dart';
import '../../widgets/app_carousel.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'logo'.assetPNG,
          height: 32.height,
          width: 32.width,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.locationPin,
                  color: AppColors.darkGrey,
                ),
                SizedBox(width: 8.width),
                AppText(
                  title: 'Mansoura, Egypt',
                  fontSize: 18.font,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
            SizedBox(height: 20.height),
            AppTextField(
              leading: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20.height,
              ),
              hint: "Search",
            ),
            SizedBox(height: 20.height),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AppCarousel(
                    images: [
                      'https://cdn.britannica.com/17/196817-159-9E487F15/vegetables.jpg',
                      'https://cdn.britannica.com/39/187439-050-35BA4DCA/Broccoli-florets.jpg',
                      'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6'
                    ],
                  ),
                  SizedBox(height: 20.height),
                  SectionTitle(
                    title: 'Exclusive Offers',
                  ),
                  SizedBox(height: 20.height),
                  SizedBox(
                    height: ProductCard.height,
                    child: ListView.separated(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return ProductCard(
                            imageUrl: 'https://static.vecteezy.com/system/resources/previews/029/200/269/non_2x/banana-transparent-background-free-png.png',  // صورة الموز
                            title: 'Banana',
                            subtitle: '7pcs, Priceg',
                            price: '\$4.99',
                          );
                        } else {
                          return ProductCard(
                            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBrPtB4GtayFzrxj9LIJNEXpwlU2Gj6ybuzw&s',  // صورة التفاح
                            title: 'Red Apple',
                            subtitle: '1kg, Priceg',
                            price: '\$4.99',
                          );
                        }
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 16.width),
                    ),
                  ),
                  SizedBox(height: 20.height),
                  SectionTitle(
                    title: 'Best Selling',
                  ),
                  SizedBox(height: 20.height),
                  SizedBox(
                    height: ProductCard.height,
                    child: ListView.separated(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return ProductCard(
                            imageUrl: 'https://cdn.mafrservices.com/sys-master-root/hb2/hb6/9432559091742/596984_main.jpg?im=Resize=1700',  // صورة الفلفل الأحمر
                            title: 'Red Pepper',
                            subtitle: '1kg, Priceg',
                            price: '\$4.99',
                          );
                        } else {
                          return ProductCard(
                            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1wdrTZjrj7Rm2oHIECRw11UlmHKtpc4KfXw&s',  // صورة الزنجبيل
                            title: 'Ginger',
                            subtitle: '250gm,Priceq',
                            price: '\$4.99',
                          );
                        }
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 16.width),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
