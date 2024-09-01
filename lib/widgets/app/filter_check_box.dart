import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';


import '../../core/utils/colors.dart';
import '../app_check_box.dart';
import '../app_text.dart';

class FilterCheckBox extends StatelessWidget {
  const FilterCheckBox({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          AppCheckBox(
            isSelected: isSelected,
          ),
          SizedBox(width: 12.width),
          AppText(
            title: 'Eggs',
            color: isSelected ? AppColors.primary : AppColors.black,
          ),
        ],
      ),
    );
  }
}
