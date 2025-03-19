import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utilities/string_modifications.dart';

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


class AppAvatar extends StatelessWidget {
  const AppAvatar({super.key, this.avatar, this.name, required this.height, required this.width, this.isBorder = false});
  final String? avatar,name;
  final double height,width;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: isBorder ? EdgeInsets.all(1):null,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isBorder ? Border.all(
          color: AppColors.divider,
        ):null,
      ),
      child: CircleAvatar(
        backgroundImage: (avatar??'').trim().isNotEmpty ? AssetImage(
          avatar!,
        ):null,
        backgroundColor: AppColors.indicator,
        child: (avatar??'').trim().isEmpty ? Text(nameSplit(name)??'AB',style: TextStyle(color: AppColors.seed, fontSize: AppSizes.fontSizeSmall, fontWeight: FontWeight.w600),): null,
      ),
    );
  }
}

