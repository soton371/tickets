import 'package:flutter/material.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_route_paths.dart';
import '../../../../core/widgets/widgets.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(isNotification: true,),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
        children: [
          SizedBox(height: AppSizes.paddingInside,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("124 tickets", style: TextStyle(color: AppColors.headlineGrey, fontWeight: FontWeight.w500),),

              IconButton(onPressed: (){
                context.go(AppRoutePaths.filter);
              }, icon: Icon(Icons.filter_alt_outlined, color: AppColors.title,),)
            ],
          ),
          SizedBox(
            height: AppSizes.paddingBody,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
              itemBuilder: (_,i){
            return Container(
              padding: EdgeInsets.all(AppSizes.paddingInside),
              margin: EdgeInsets.only(bottom: AppSizes.paddingBody),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                color: AppColors.containerBackground
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          color: AppColors.status("New").withValues(alpha: 0.12)
                      ),
                      child: Text("New",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.status("New"), fontWeight: FontWeight.w600),)),
                  SizedBox(height: 8,),
                  Text("#ID 132198423", style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subTitle, fontWeight: FontWeight.w500),),
                  SizedBox(height: 8,),
                  Text("Search view, which can display dynamic suggestions, is the focused state of search bar.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle( color: AppColors.title, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text("Michale  ",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500)),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColors.divider,
                      ),
                      Text("  23 Dec 2023 03:43 pm",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(),
                  SizedBox(height: 5,),
                  Wrap(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSizes.radius),
                              border: Border.all(color: AppColors.divider),
                              color: AppColors.background
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.priority("Low"),
                              ),
                              Text("  Low",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500)),
                            ],
                          )),
                      SizedBox(width: 10,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSizes.radius),
                              border: Border.all(color: AppColors.divider),
                            color: AppColors.background
                          ),
                          child: Text("Open",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                    ],
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
