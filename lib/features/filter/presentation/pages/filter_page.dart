import 'package:flutter/material.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/core/widgets/widgets.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: TextStyle(
            fontSize: AppSizes.fontSizeLarge,
            fontWeight: FontWeight.w600,
            color: AppColors.title,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Apply",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.subTitle,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Brand',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeLarge,
                  fontWeight: FontWeight.w600,
                  color: AppColors.title,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, i) {
                  return Row(
                    children: [
                      Checkbox.adaptive(
                        value: false,
                        onChanged: (onChanged) {},
                      ),
                      CircleAvatar(radius: 14),
                      SizedBox(width: 8),
                      Text(
                        "Data $i",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.checkBoxTitle,
                        ),
                      ),
                    ],
                  );
                },
              ),
              // Priority section
              Text(
                'Priority',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeLarge,
                  fontWeight: FontWeight.w600,
                  color: AppColors.title,
                ),
              ),
              SizedBox(height: AppSizes.paddingInside,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.headlineGrey,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingInside),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: null,
                    icon: Icon(Icons.keyboard_arrow_down),
                    hint: Text("Select priority",style: TextStyle(fontSize: AppSizes.fontSizeLarge, fontWeight: FontWeight.w500, color: AppColors.headlineGrey),),
                    items: [
                      DropdownMenuItem(value: "1", child: Text("Dropdown 1")),
                      DropdownMenuItem(value: "2", child: Text("Dropdown 2")),
                      DropdownMenuItem(value: "3", child: Text("Dropdown 3")),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(height: AppSizes.paddingBody,),
              //tag
              Text(
                'Tags',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeLarge,
                  fontWeight: FontWeight.w600,
                  color: AppColors.title,
                ),
              ),
              SizedBox(height: AppSizes.paddingInside,),
              AppSearchBar(hintText: "Search tags",),
              SizedBox(height: AppSizes.paddingInside,),
              Wrap(
                runSpacing: AppSizes.paddingInside,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag one",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                  SizedBox(width: AppSizes.paddingInside,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag two",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                  SizedBox(width: AppSizes.paddingInside,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag three wit long text",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                  SizedBox(width: AppSizes.paddingInside,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag four",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                  SizedBox(width: AppSizes.paddingInside,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag five",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                  SizedBox(width: AppSizes.paddingInside,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag six wit long text",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),
                  SizedBox(width: AppSizes.paddingInside,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                          border: Border.all(color: AppColors.divider),
                          color: AppColors.background
                      ),
                      child: Text("Tag seven",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.headlineGrey, fontWeight: FontWeight.w500))),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
