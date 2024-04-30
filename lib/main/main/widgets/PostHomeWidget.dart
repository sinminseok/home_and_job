import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/MainController.dart';

class PostHomeWidget extends StatelessWidget {
  MainController controller;

  PostHomeWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60.h, left: 15.w),
          child: SubTitle1Text("어떤 집을 찾고 계신가요?", kTextBlackColor),
        ),
        Container(

          margin: EdgeInsets.only(top: 40.h),
          width: 340.w,
          child: _buildRegisterHome(),
        ),

      ],
    ));
  }

  Widget _buildRegisterHome() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.moveToHomeRegisterView();
            },
            child: Container(
              width: 310.w,
              height: 100.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: kGrey200Color),
                  color: kWhiteBackGroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 45.w,
                          height: 45.h,
                          margin: EdgeInsets.only(left: 15.h, bottom: 5.h),
                          child: Image.asset("assets/icons/register_icon.png")),
                      Container(
                        margin: EdgeInsets.only(top: 2.h, left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: Body2Text("집 매물을 내놓기", kGrey700Color),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: HelperText(
                                  "직접 자신의 집 게시글을 올려보세요", kGrey500Color),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 14.w),
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: kDarkBlue,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSelectHome() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.moveToHomeView();
            },
            child: Container(
              width: 310.w,
              height: 200.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: kGrey200Color),
                  color: kWhiteBackGroundColor),
              child: Column(
                children: [
                  Container(
                      width: 50.w,
                      height: 50.h,
                      margin: EdgeInsets.only(top: 50.h),
                      child: Image.asset("assets/icons/home_icon.png")),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Body1Text("집 알아보기", kTextBlackColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSelectJob() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.moveToHomeView();
            },
            child: Container(
              width: 150.w,
              height: 200.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: kGrey200Color),
                  color: kWhiteBackGroundColor),
              child: Column(
                children: [
                  Container(
                      width: 50.w,
                      height: 50.h,
                      margin: EdgeInsets.only(top: 50.h),
                      child: Image.asset("assets/icons/job_icon.png")),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Body1Text("일자리 알아보기", kTextBlackColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
