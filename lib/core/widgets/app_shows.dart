import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key, required this.msg, this.icon});

  final String? msg;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingBody),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(AppSizes.paddingBody),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.fill),
                child: Icon(
                  icon ?? Icons.info_outline,
                  color: AppColors.subTitle,
                  size: 40,
                )),
            const SizedBox(
              height: AppSizes.paddingInside,
            ),
            Text(
              msg ?? 'Something went wrong',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.subTitle,
                  fontStyle: FontStyle.italic,
                  fontSize: AppSizes.fontSizeDefault),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class AppLoadingState extends StatelessWidget {
  const AppLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
