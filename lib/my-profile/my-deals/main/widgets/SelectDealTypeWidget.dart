import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/my-profile/my-deals/main/controller/MyDealListController.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/home/enums/HomeStatus.dart';

class SelectDealTypeWidget extends StatelessWidget {
  MyDealListController _controller;

  SelectDealTypeWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 310.w,
          margin: EdgeInsets.only(top: 20.h, left: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDuringButton(),
              _buildDoneButton(),
              _buildCancelButton(),
            ],
          ),
        ));
  }

  Widget _buildDuringButton() {
    return InkWell(
      onTap: () {
        _controller.ontapState(0);
      },
      child: Container(
        width: 100.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _controller.dealState == 0
              ? kTextBlackColor
              : kWhiteBackGroundColor,
          border: Border.all(color: kGrey300Color),
        ),
        child: Center(
          child: FRegularText(
              "During",
              _controller.dealState == 0
                  ? kWhiteBackGroundColor
                  : kGrey500Color,
              14),
        ),
      ),
    );
  }

  Widget _buildDoneButton() {
    return InkWell(
      onTap: () {
        _controller.ontapState(1);
      },
      child: Container(
        width: 100.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _controller.dealState == 1
              ? kTextBlackColor
              : kWhiteBackGroundColor,
          border: Border.all(color: kGrey300Color),
        ),
        child: Center(
          child: FRegularText(
              "Done",
              _controller.dealState == 1
                  ? kWhiteBackGroundColor
                  : kGrey500Color,
              14),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return InkWell(
      onTap: () {
        _controller.ontapState(2);
      },
      child: Container(
        width: 100.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _controller.dealState == 2
              ? kTextBlackColor
              : kWhiteBackGroundColor,
          border: Border.all(color: kGrey300Color),
        ),
        child: Center(
          child: FRegularText(
              "Cancel",
              _controller.dealState == 2
                  ? kWhiteBackGroundColor
                  : kGrey500Color,
              14),
        ),
      ),
    );
  }
}
