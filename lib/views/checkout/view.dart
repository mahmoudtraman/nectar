import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar_app/core/extensions/build_context.dart';
import 'package:nectar_app/core/extensions/num.dart';


import '../../core/route_utils/route_utils.dart';
import '../../core/utils/colors.dart';
import '../../widgets/app/failed_order_dialog.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => this,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(1.65),
      padding: EdgeInsets.symmetric(
        vertical: 32.height,
        horizontal: 24.width,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: 'Checkout',
                fontWeight: FontWeight.w600,
                fontSize: 20.font,
              ),
              InkWell(
                onTap: () => RouteUtils.pop(context),
                child: Icon(
                  FontAwesomeIcons.xmark,
                ),
              ),
            ],
          ),
          _divider(),
          _CheckoutListTile(
            title: "Delivery",
            subtitle: "Select Method",
          ),
          _divider(),
          _CheckoutListTile(
            title: "Payment",
            trailing: Icon(
              FontAwesomeIcons.creditCard,
              size: 16,
            ),
          ),
          _divider(),
          _CheckoutListTile(
            title: "Promo Code",
            subtitle: 'Pick discount',
          ),
          _divider(),
          _CheckoutListTile(
            title: "Total Cost",
            subtitle: '\$2352.54',
          ),
          _divider(),
          RichText(
            text: TextSpan(
              text: "By placing an order you agree to our",
              style: TextStyle(
                color: AppColors.darkGrey.withOpacity(0.6),
                fontWeight: FontWeight.w600,
                fontSize: 14.font,
                height: 22.height / 14.font,
              ),
              children: [
                TextSpan(
                  text: ' Terms ',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                ),
                TextSpan(
                  text: 'And',
                ),
                TextSpan(
                  text: ' Conditions ',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.height),
          AppButton(
            title: 'Place Order',
            onTap: () {
              RouteUtils.pop(context);
              FailedOrderDialog().show(context);
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.radius),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      color: AppColors.grey.withOpacity(0.5),
      height: 40.height,
    );
  }
}

class _CheckoutListTile extends StatelessWidget {
  const _CheckoutListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            title: title,
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 16.font,
          ),
        ),
        if (subtitle != null)
        AppText(
          title: subtitle!,
          fontWeight: FontWeight.w600,
        ),
        if (trailing != null)
          trailing!,
        SizedBox(width: 8.width),
        Icon(
          FontAwesomeIcons.chevronRight,
          size: 16,
        ),
      ],
    );
  }
}
