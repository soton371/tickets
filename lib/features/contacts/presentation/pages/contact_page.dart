import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/features/features_di.dart';

import '../../../../core/widgets/widgets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(DoFetchContactList());
    return Scaffold(
      appBar: AppAppBar(isNotification: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: AppSizes.paddingBody,
            ),
            child: AppSearchBar(hintText: "Search contacts"),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if(state is ContactListLoading) return AppLoadingState();
                if(state is ContactListSuccess) {
                  return ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingBody,
                  ),
                  children: [
                    SizedBox(height: AppSizes.paddingBody),
                    Text(
                      "42 Contacts",
                      style: TextStyle(
                        color: AppColors.headlineGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: AppSizes.paddingBody),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (_, i) {
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
                                      backgroundImage: AssetImage(
                                        AppImages.contact1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: AppSizes.paddingInside),
                                  //name
                                  Expanded(
                                    child: Text(
                                      "Michale Kahnwald",
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
                                    " michel@email.com",
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
                                    " +12 34 56 78 90",
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
                                    " 12A, Lillistrom, Norway",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.headlineGrey,
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
                if(state is ContactListFailure) return AppEmpty(msg: state.message);
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
