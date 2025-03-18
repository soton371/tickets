import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.hintText});
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none
        ),
        fillColor: AppColors.fill,
        prefixIcon: Icon(CupertinoIcons.search),
        hintText: hintText ?? "Search here",
        hintStyle: TextStyle(fontSize: AppSizes.fontSizeLarge, fontWeight: FontWeight.w500, color: AppColors.headlineGrey),
      ),
    );
  }
}
