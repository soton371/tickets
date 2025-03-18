import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/core/widgets/widgets.dart';
import 'package:tickets/features/profile/presentation/widgets/basic_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "My Profile"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(width: AppSizes.paddingBody),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jonaus Kahnwald",
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeLarge,
                          fontWeight: FontWeight.w600,
                          color: AppColors.checkBoxTitle,
                        ),
                      ),
                      Text(
                        "Support",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.subTitle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.paddingBody),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined, color: AppColors.title),
                ),
              ],
            ),
          ),

          //basic info
          Padding(
            padding: const EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basic info",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.fontSizeSmall,
                    color: AppColors.headlineGrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingInside),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BasicInfoTile(name: "First Name", value: "Jonaus"),
                      SizedBox(height: 8),
                      BasicInfoTile(name: "Last Name", value: "Kahnwald"),
                      SizedBox(height: 8),
                      BasicInfoTile(name: "Email", value: "Username@email.com"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //for assign role
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
            child: Text(
              "Assigned roles (3)",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.fontSizeSmall,
                color: AppColors.headlineGrey,
              ),
            ),
          ),

          SizedBox(height: AppSizes.paddingBody),

          SizedBox(
            height: 192,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, i) {
                return Container(
                  height: 192,
                  width: AppSizes.width(context, 240),
                  padding: EdgeInsets.all(AppSizes.paddingInside),
                  margin: EdgeInsets.only(left: AppSizes.paddingBody),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                    color: AppColors.containerBackground,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Manager",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeOverLarge,
                          fontWeight: FontWeight.w500,
                          color: AppColors.title,
                        ),
                      ),
                      SizedBox(height: 7),
                      Divider(),
                      SizedBox(height: 7),
                      Text(
                        "Group",
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeSmall,
                          fontWeight: FontWeight.w600,
                          color: AppColors.subTitle,
                        ),
                      ),
                      Text(
                        "Codecyaneon support",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.headlineGrey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Manager",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeSmall,
                          fontWeight: FontWeight.w600,
                          color: AppColors.subTitle,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.divider),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(AppImages.contact1),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Jonaus Kahnwald",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.headlineGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          //logout button
          Padding(
            padding: EdgeInsets.all(AppSizes.paddingBody),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton.icon(
                  onPressed: (){}, label: Text(" Logout"), icon: Icon(Icons.logout),),
              ))
        ],
      ),
    );
  }
}
