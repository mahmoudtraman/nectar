import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/extensions/string.dart';

import '../../core/route_utils/route_utils.dart';
import '../../core/utils/colors.dart';
import '../../views/checkout/view.dart';
import '../../views/nav_bar/view.dart';
import '../app_button.dart';
import '../app_text.dart';

class FailedOrderDialog extends StatelessWidget {
  const FailedOrderDialog({Key? key}) : super(key: key);

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.horizontal,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => RouteUtils.pop(context),
                  child: Icon(
                    FontAwesomeIcons.xmark,
                  ),
                ),
              ),
              SizedBox(height: 16.height),
              Image.asset(
                'failed_order'.assetPNG,
                height: 220.height,
                width: 220.width,
              ),
              SizedBox(height: 32.height),
              AppText(
                title: 'Oops! Order Failed',
                fontSize: 28.font,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.height),
              AppText(
                title: 'Something went tembly wrong.',
                fontSize: 16.font,
                color: AppColors.darkGrey,
              ),
              SizedBox(height: 40.height),
              AppButton(
                title: 'Please try again',
                onTap: () {
                  RouteUtils.pop(context);
                  CheckoutView().show(context);
                },
              ),
              SizedBox(height: 30.height),
              AppText(
                title: 'Back to Home',
                fontWeight: FontWeight.w600,
                fontSize: 18.height,
                onTap: () => RouteUtils.pushAndRemoveAll(context, NavBarView()),
              ),
              SizedBox(height: 12.height),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
