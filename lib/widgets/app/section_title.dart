import 'package:flutter/material.dart';

import 'package:nectar_app/core/extensions/num.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            title: title,
            fontSize: 20.height,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppText(
          title: 'See all',
          fontSize: 16.height,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
