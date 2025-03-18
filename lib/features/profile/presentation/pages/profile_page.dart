import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/core/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "My Profile",),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.paddingBody),
            color: AppColors.indicator,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppImages.contact1),
                ),
                SizedBox(width: AppSizes.paddingBody,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jonaus Kahnwald",style: TextStyle(
                        fontSize: AppSizes.fontSizeLarge,
                        fontWeight: FontWeight.w600,
                        color: AppColors.checkBoxTitle
                      ),),
                      Text("Support",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.subTitle
                      ),),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.paddingBody,),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined, color: AppColors.title,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
