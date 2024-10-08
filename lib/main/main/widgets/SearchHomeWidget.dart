
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/main/main/controller/MainController.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class SearchHomeWidget extends StatelessWidget {
  MainController controller;


  SearchHomeWidget(this.controller);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRegisterHome(),
      ],
    );
  }

  Widget _buildRegisterHome() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.moveToHomeView();
            },
            child: Container(
              width: 335.w,
              height: 80.h,
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
                  color: kPrimaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 50.w,
                          height: 50.h,
                          margin: EdgeInsets.only(left: 10.h, bottom: 5.h),
                          child: Image.asset("assets/icons/home_icon.png")),
                      Container(
                        margin: EdgeInsets.only(top: 2.h, left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 23.h),
                              child: Body1Text("Search for rooms", kWhiteBackGroundColor),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(top: 5.h),
                            //   child: HelperText(
                            //       "쉐어/렌트 가능한 매물을 찾아보세요.", kWhiteBackGroundColor),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kLightBlue
                    ),
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
}
