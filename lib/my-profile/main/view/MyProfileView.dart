import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/main/widgets/ProviderListWidget.dart';
import 'package:home_and_job/my-profile/main/widgets/ProfileWidget.dart';

import '../controller/MyProfileController.dart';
import '../widgets/CommonList.dart';

class MyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProfileController controller = MyProfileController();

    return Scaffold(
        backgroundColor: kGrey100Color,


        // appBar: CommonAppBar(canBack: false, title: '마이 프로필', color: kWhiteBackGroundColor,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),

              ProfileWidget(controller),
              ProviderListWidget(),
              CommonList()
            ],
          ),
        ));
  }

  Widget _buildAppBar() {
    return Container(
      width: 380.w,
      color: kGrey100Color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20.w, top: 30.h),
              child: Icon(
                Icons.settings,
                size: 20.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
