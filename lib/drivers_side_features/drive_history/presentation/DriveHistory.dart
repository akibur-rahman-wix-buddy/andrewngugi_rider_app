import 'package:andrewngugi_rider_app/gen/assets.gen.dart';
import 'package:andrewngugi_rider_app/gen/colors.gen.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'CompletedDriveHistoryScreen.dart';
import 'CancelledDriveHistoryScreen.dart';
import 'OngoingDriveHistoryScreen.dart';

class DriveHistory extends StatefulWidget {
  const DriveHistory({super.key});

  @override
  State<DriveHistory> createState() => _DriveHistoryState();
}

class _DriveHistoryState extends State<DriveHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.bg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){

                  NavigationService.goBack;

                }, icon:SvgPicture.asset(Assets.icons.backIcon)),
              ),
              title:
                  const Text('Drive History', style: TextStyle(color: AppColors.c141414)),
              centerTitle: true,
              automaticallyImplyLeading: false,
              bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blueGrey,
                indicatorColor: Colors.redAccent,
                tabs: [
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                OngoingDriveHistoryScreen(),
                CompletedDriveHistoryScreen(),
                CancelledDriveHistoryScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
