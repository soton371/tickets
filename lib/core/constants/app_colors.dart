import 'package:flutter/material.dart';

class AppColors {
  static const Color seed = Color(0xff00A1E0);
  static const Color indicator = Color(0xffE6F6FC);
  static const Color shadow = Colors.grey;
  static const Color background = Colors.white;
  static const Color badge = Color(0xffFE475B);
  static const Color headlineGrey = Color(0xff797979);
  static const Color containerBackground = Color(0xffF9FAFB);
  static const Color divider = Color(0xffD8E0ED);
  static const Color subTitle = Color(0xffB7B7B7);
  static const Color title = Color(0xff3B3B3B);
  static const Color checkBoxTitle = Color(0xff5C5D76);
  static const Color fill = Color(0xffF3F4F8);

  static Color status(String? status){
    if((status??'').isEmpty)return headlineGrey;
    final statusLower = status!.toLowerCase().trim();
    if(statusLower.startsWith('n'))return Color(0xff44A9F1);
    if(statusLower.startsWith('l'))return Color(0xffFFAB00);
    if(statusLower.startsWith('c'))return Color(0xff5A49B4);
    if(statusLower.startsWith('o'))return Color(0xffFE475B);
    return headlineGrey;
  }

  static Color priority(String? priority){
    if((priority??'').isEmpty)return headlineGrey;
    final priorityLower = priority!.toLowerCase().trim();
    if(priorityLower.startsWith('l'))return Color(0xff0CAA1B);
    if(priorityLower.startsWith('u'))return Color(0xffFE475B);
    if(priorityLower.startsWith('m'))return Color(0xffFFAB00);
    return headlineGrey;
  }
}
