import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar_app/core/extensions/num.dart';
import '../../core/route_utils/route_utils.dart';
import '../../core/utils/colors.dart';
import '../../widgets/app/filter_check_box.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Filter",
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.xmark),
          onPressed: () => RouteUtils.pop(context),
        ), centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 20.height),
              AppText(
                title: 'Categories',
                fontWeight: FontWeight.w600,
                fontSize: 20.font,
              ),
              SizedBox(height: 8.height),
              ...[1,2,3].map((e) {
                return FilterCheckBox(isSelected: e.isEven);
              }),
              SizedBox(height: 20.height),
              AppText(
                title: 'Brand',
                fontWeight: FontWeight.w600,
                fontSize: 20.font,
              ),
              SizedBox(height: 8.height),
              ...[1,3].map((e) {
                return FilterCheckBox(isSelected: e.isOdd);
              }),
              SizedBox(height: 20.height),
              AppText(
                title: 'Rates',
                fontWeight: FontWeight.w600,
                fontSize: 20.font,
              ),
              SizedBox(height: 8.height),
              ...[1,2].map((e) {
                return FilterCheckBox(isSelected: e.isOdd);
              }),
              SizedBox(height: 40.height),
              AppButton(
                title: 'Apply Filter',
                onTap: () {},
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
      ),
    );
  }
}
