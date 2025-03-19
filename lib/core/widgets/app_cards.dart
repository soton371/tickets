import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OutlineCard extends StatelessWidget {
  const OutlineCard({super.key, required this.value, this.isPriority = false});
  final String value;
  final bool isPriority;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.radius,
        ),
        border: Border.all(color: AppColors.divider),
        color: AppColors.background,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(isPriority)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: AppColors.priority(value),
                ),
                SizedBox(width: 8,)
              ],
            ),

          Text(value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: AppSizes.fontSizeSmall,
              color: AppColors.headlineGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
