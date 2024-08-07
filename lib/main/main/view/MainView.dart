import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/constants/Colors.dart';
import '../controller/MainController.dart';
import '../widgets/HotPostWidget.dart';
import '../widgets/MainAppBar.dart';
import '../widgets/PostHomeWidget.dart';
import '../widgets/SearchHomeWidget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = MainController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //MainHeaderWidget(),
            Column(
              children: [
                // InkWell(
                //   onTap: (){
                //     Get.to(() => ChatPage());
                //   },
                //   child: Container(
                //     child: Body2Text("DASD", kTextBlackColor),
                //   ),
                // ),
                SearchHomeWidget(controller),
                PostHomeWidget(controller),
                HotPlaceWidget(controller),
                //BannerWidget(controller),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
