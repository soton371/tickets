import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/core/widgets/widgets.dart';
import 'package:tickets/features/profile/presentation/widgets/basic_info_tile.dart';

import '../../../features_di.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "My Profile"),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state is ProfileSuccess){
            final data = state.profileResponse;
            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSizes.paddingBody),
                  color: AppColors.indicator,
                  child: Row(
                    children: [
                      AppAvatar(height: 60, width: 60,avatar: data.avatar,name: data.name,),
                      SizedBox(width: AppSizes.paddingBody),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name??'',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: AppSizes.fontSizeLarge,
                                fontWeight: FontWeight.w600,
                                color: AppColors.checkBoxTitle,
                              ),
                            ),
                            Text(data.role??'',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                            BasicInfoTile(name: "First Name", value: data.firstName??''),
                            SizedBox(height: 8),
                            BasicInfoTile(name: "Last Name", value: data.lastName??''),
                            SizedBox(height: 8),
                            BasicInfoTile(
                              name: "Email",
                              value: data.email??'',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //for assign role
                if((data.assignedRoles??[]).isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
                        child: Text(
                          "Assigned roles (${data.assignedRoles!.length})",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
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
                          itemCount: data.assignedRoles!.length,
                          itemBuilder: (_, i) {
                            final assignedRole = data.assignedRoles![i];
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
                                  Text(assignedRole.title??'',
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
                                  Text('Group',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: AppSizes.fontSizeSmall,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.subTitle,
                                    ),
                                  ),
                                  Text(assignedRole.group??'',
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
                                      AppAvatar(height: 32, width: 32,avatar: assignedRole.avatar,name: assignedRole.manager,isBorder: true,),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(assignedRole.manager??'',
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

                    ],
                  ),

                //logout button
                Padding(
                  padding: EdgeInsets.all(AppSizes.paddingBody),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(" Logout"),
                      icon: Icon(Icons.logout),
                    ),
                  ),
                ),
              ],
            );
          }else{
            return AppEmpty(msg: "Login First");
          }
        },
      ),
    );
  }
}
