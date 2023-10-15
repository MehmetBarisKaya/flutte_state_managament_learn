import 'package:flutter/material.dart';
import 'package:state_managament_in_life/feature/travel/view/travel_view.dart';

enum _TravelPages { home, bookmark, notification, profile }

class TravelTabView extends StatelessWidget {
  const TravelTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _TravelPages.values.length,
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
              ]),
            ),
            body: TabBarView(
              physics: RangeMaintainingScrollPhysics(),
              children: [
                TravelView(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
            )));
  }
}
