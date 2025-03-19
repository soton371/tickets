import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_route_paths.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/ticket_list_response_model.dart';

class TicketListView extends StatelessWidget {
  const TicketListView({super.key, required this.ticketList});
  final List<TicketListResponseModel> ticketList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
      children: [
        SizedBox(height: AppSizes.paddingInside),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${ticketList.length} tickets",
              style: TextStyle(
                color: AppColors.headlineGrey,
                fontWeight: FontWeight.w500,
              ),
            ),

            IconButton(
              onPressed: () {
                context.go(AppRoutePaths.filter);
              },
              icon: Icon(
                Icons.filter_alt_outlined,
                color: AppColors.title,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.paddingBody),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ticketList.length,
          itemBuilder: (_, i) {
            final data = ticketList[i];
            return Container(
              padding: EdgeInsets.all(AppSizes.paddingInside),
              margin: EdgeInsets.only(bottom: AppSizes.paddingBody),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                color: AppColors.containerBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSizes.radius,
                      ),
                      color: AppColors.status(
                        data.status??'',
                      ).withValues(alpha: 0.12),
                    ),
                    child: Text(
                      data.status??'',
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeSmall,
                        color: AppColors.status(data.status??''),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "#ID ${data.id??''}",
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeSmall,
                      color: AppColors.subTitle,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(data.subject??'',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColors.title,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "${data.user??''}  ",
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeSmall,
                          color: AppColors.headlineGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColors.divider,
                      ),
                      Text(
                        "  ${data.timestamp??''}",
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeSmall,
                          color: AppColors.headlineGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 5),
                  Wrap(
                    children: [
                      if(data.priority != null)
                        OutlineCard(value: data.priority!, isPriority: true,),
                      if((data.state??[]).isNotEmpty)
                        ...data.state!.map((value)=>Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: OutlineCard(value: value,),
                        ),)

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



