import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/core/widgets/widgets.dart';
import 'package:tickets/features/features_di.dart';

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
                onPressed: () {
                  context.read<TicketsBloc>().add(
                    DoFilterTicketList(statusList: state.statusList),
                  );
                  Navigator.pop(context);
                },
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
                  if (state.statusList.isNotEmpty)
                    Column(
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
                          itemCount: state.statusList.length,
                          itemBuilder: (_, i) {
                            final status = state.statusList[i];
                            return Row(
                              children: [
                                Checkbox.adaptive(
                                  value: status.selected,
                                  onChanged: (changed) {
                                    status.selected = changed ?? false;
                                    context.read<FilterBloc>().add(
                                      DoStatusChange(state.statusList),
                                    );
                                  },
                                ),
                                Text(
                                  status.status,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.checkBoxTitle,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),

                  // Priority section
                  if (state.priorityList.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Priority',
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeLarge,
                            fontWeight: FontWeight.w600,
                            color: AppColors.title,
                          ),
                        ),
                        SizedBox(height: AppSizes.paddingInside),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.headlineGrey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingInside,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String?>(
                              isExpanded: true,
                              value: state.selectedPriority,
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text(
                                "Select priority",
                                style: TextStyle(
                                  fontSize: AppSizes.fontSizeLarge,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.headlineGrey,
                                ),
                              ),
                              items: [
                                DropdownMenuItem<String?>(
                                  value: null,
                                  child: Text("Select priority"),
                                ),
                                ...state.priorityList
                                    .map(
                                      (priority) => DropdownMenuItem<String?>(
                                        value: priority,
                                        child: Text(priority),
                                      ),
                                    ),
                              ],
                              onChanged: (value) {
                                context.read<FilterBloc>().add(
                                  DoSelectedPriorityChanged(value),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.paddingBody),
                      ],
                    ),

                  //tag
                  Text(
                    'Tags',
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeLarge,
                      fontWeight: FontWeight.w600,
                      color: AppColors.title,
                    ),
                  ),
                  SizedBox(height: AppSizes.paddingInside),
                  AppSearchBar(hintText: "Search tags"),
                  SizedBox(height: AppSizes.paddingInside),
                  Wrap(
                    runSpacing: AppSizes.paddingInside,
                    children:
                        tags.map((tag) => OutlineCard(value: tag)).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

final List<String> priorities = ["Dropdown 1", "Dropdown 2", "Dropdown 3"];
final List<String> tags = [
  "Tag one",
  "Tag two",
  "Tag three wit long text",
  "Tag four",
  "Tag five",
  "Tag six wit long text",
  "Tag seven",
];
