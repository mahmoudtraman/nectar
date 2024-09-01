import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';
import '../../core/utils/colors.dart';
import '../../widgets/app/cart_card.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../checkout/view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: ("My Cart"), centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CartCard();
                },
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.grey.withOpacity(0.5),
                  height: 48.height,
                ),
              ),
            ),
            SizedBox(height: 20.height),
            Stack(
              children: [
                AppButton(
                  title: 'Go to Checkout',
                  onTap: () => CheckoutView().show(context),
                ),
                Positioned(
                  top: 0,
                  right: 20,
                  bottom: 0,
                  child: UnconstrainedBox(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: AppText(
                        title: '\$50.00',
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.font,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.radius),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
