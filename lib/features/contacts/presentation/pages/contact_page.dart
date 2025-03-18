import 'package:flutter/material.dart';
import 'package:tickets/core/constants/constants.dart';

import '../../../../core/widgets/widgets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingBody
        ),
        children: [
          SizedBox(height: 5,),
          AppSearchBar(hintText: "Search contacts",),
          SizedBox(height: AppSizes.paddingBody,),
          Text("42 Contacts", style: TextStyle(color: AppColors.headlineGrey, fontWeight: FontWeight.w500),),
          SizedBox(height: AppSizes.paddingBody,),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            itemCount: 5,
              itemBuilder: (_,i){
                return Container(
                  padding: EdgeInsets.all(AppSizes.paddingInside),
                  margin: EdgeInsets.only(bottom: AppSizes.paddingBody),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius),
                      color: AppColors.containerBackground
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
                              border: Border.all(color: AppColors.divider),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(AppImages.contact1),
                            ),
                          ),
                          SizedBox(width: AppSizes.paddingInside,),
                          //name
                          Expanded(child: Text("Michale Kahnwald",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.fontSizeLarge,
                            color: AppColors.title
                          ),)),
                          //action
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
                        ],
                      )
                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
