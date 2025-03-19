import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickets/features/feature_pages.dart';
import '../../../../core/constants/constants.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> pages = [TicketPage(), ContactPage(), ProfilePage()];
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    indexNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, value, child) => pages[value],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder:
            (context, value, child) => NavigationBar(
              selectedIndex: value,
              onDestinationSelected: (index) {
                indexNotifier.value = index;
              },
              shadowColor: AppColors.shadow,
              backgroundColor: AppColors.background,
              indicatorColor: AppColors.indicator,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.tickets_fill,
                    color: AppColors.seed,
                  ),
                  icon: Icon(CupertinoIcons.tickets),
                  label: 'Tickets',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.person_2_fill,
                    color: AppColors.seed,
                  ),
                  icon: Icon(CupertinoIcons.person_2),
                  label: 'Contacts',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.person_fill,
                    color: AppColors.seed,
                  ),
                  icon: Icon(CupertinoIcons.person),
                  label: 'Profile',
                ),
              ],
            ),
      ),
    );
  }
}
