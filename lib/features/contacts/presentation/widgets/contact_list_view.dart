import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../data/models/contact_list_response_model.dart';

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
                      Container(
                        height: 44,
                        width: 44,
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.divider,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: (data.avatar??'').trim().isNotEmpty ? AssetImage(
                            data.avatar!,
                          ):null,
                          backgroundColor: AppColors.indicator,
                          child: (data.avatar??'').trim().isEmpty ? Text("AB",style: TextStyle(color: AppColors.seed, fontSize: AppSizes.fontSizeSmall, fontWeight: FontWeight.w600),): null,
                        ),
                      ),
                      SizedBox(width: AppSizes.paddingInside),
                      //name
                      Expanded(
                        child: Text(
                          data.name??'',
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
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: AppColors.headlineGrey,
                        size: 16,
                      ),
                      Text(
                        " ${data.email??''}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.headlineGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_in_talk_outlined,
                        color: AppColors.headlineGrey,
                        size: 16,
                      ),
                      Text(
                        " ${data.phone??''}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.headlineGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.headlineGrey,
                        size: 16,
                      ),
                      Text(
                        " ${(data.address??'').isEmpty? 'Not added yet' : data.address}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: (data.address??'').isEmpty? AppColors.subTitle: AppColors.headlineGrey,
                        ),
                      ),
                    ],
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
