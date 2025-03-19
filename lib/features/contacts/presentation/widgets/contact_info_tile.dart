import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class ContactInfoTile extends StatelessWidget {
  const ContactInfoTile({super.key, required this.icon, this.value});
  final IconData icon;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.headlineGrey,
          size: 16,
        ),
        Flexible(
          child: Text(
            " ${(value??'').trim().isEmpty? 'Not added yet' : value}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: (value??'').trim().isEmpty? AppColors.subTitle: AppColors.headlineGrey,
            ),
          ),
        ),
      ],
    );
  }
}
