import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/contact_list_response_model.dart';
import 'contact_info_tile.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key, required this.contactList});
  final List<ContactListResponseModel> contactList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingBody,
      ),
      children: [
        SizedBox(height: AppSizes.paddingBody),
        Text(
          "${contactList.length} Contacts",
          style: TextStyle(
            color: AppColors.headlineGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: AppSizes.paddingBody),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: contactList.length,
          itemBuilder: (_, i) {
            final data = contactList[i];
            return Container(
              padding: EdgeInsets.all(AppSizes.paddingInside),
              margin: EdgeInsets.only(bottom: AppSizes.paddingBody),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppSizes.radius,
                ),
                color: AppColors.containerBackground,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      //img
                      AppAvatar(height: 44,width: 44,avatar: data.avatar,name: data.name,isBorder: true,),

                      SizedBox(width: AppSizes.paddingInside),
                      //name
                      Expanded(
                        child: Text(
                          data.name??'',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.fontSizeLarge,
                            color: AppColors.title,
                          ),
                        ),
                      ),
                      //action
                      PopupMenuButton(
                        onSelected: (value) {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        position: PopupMenuPosition.under,
                        constraints: BoxConstraints(minWidth: 200),
                        itemBuilder: (context) {
                          return AppValues.contactActions
                              .map(
                                (action) => PopupMenuItem(
                              labelTextStyle:
                              WidgetStatePropertyAll(
                                TextStyle(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: AppColors.title,
                                ),
                              ),
                              value: action,
                              child: Text(action),
                            ),
                          )
                              .toList();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.paddingInside),
                  ContactInfoTile(
                    icon: Icons.mail_outline,
                    value: data.email,
                  ),
                  ContactInfoTile(
                    icon: Icons.phone_in_talk_outlined,
                    value: data.phone,
                  ),
                  ContactInfoTile(
                    icon: Icons.location_on_outlined,
                    value: data.address,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
