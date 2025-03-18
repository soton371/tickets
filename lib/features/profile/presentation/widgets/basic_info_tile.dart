import 'package:flutter/cupertino.dart';

import '../../../../core/constants/constants.dart';

class BasicInfoTile extends StatelessWidget {
  const BasicInfoTile({super.key, required this.name, required this.value});
  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppSizes.fontSizeSmall, color: AppColors.subTitle)),
        Text(value,style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppSizes.fontSizeLarge, color: AppColors.title))
      ],
    );
  }
}
