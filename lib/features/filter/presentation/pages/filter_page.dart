import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/core/widgets/widgets.dart';

import '../bloc/filter_bloc.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
  builder: (context, state) {
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
          onPressed: () {
            Navigator.pop(context);
          },
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
                'Status',
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
                    items: priorities.map((priority)=>DropdownMenuItem(value: priority, child: Text(priority)),).toList(),
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
                children: tags.map((tag)=>OutlineCard(value: tag)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}


final List<String> priorities = ["Dropdown 1","Dropdown 2","Dropdown 3"];
final List<String> tags = ["Tag one","Tag two","Tag three wit long text", "Tag four", "Tag five", "Tag six wit long text","Tag seven"];