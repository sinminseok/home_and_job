import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/response/MyProtectedDealResponse.dart';
import 'package:home_and_job/my-profile/my-deals/widgets/DealPaymentInformationWidget.dart';
import 'package:home_and_job/my-profile/my-deals/widgets/DealRoomInformationWidget.dart';
import 'package:home_and_job/protected-deal/deal-proceeding/common/widgets/DealProcessWidget.dart';
import 'package:home_and_job/utils/Converter.dart';

/**
 * 현재 진행 중인 거래 정보 조회 View
 */
class DealDoneDetailView extends StatelessWidget {
  MyProtectedDealResponse dealResponse;

  DealDoneDetailView(this.dealResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kWhiteBackGroundColor,
      ),
      bottomSheet: SingleChildScrollView(
        child: Column(
          children: [
            _buildMainText(),
            _buildTimeInformation(),
            DealPaymentInformationWidget(dealResponse),
            DealRoomInformationWidget(dealResponse),
            Container(
              color: kWhiteBackGroundColor,
              height: 150.h,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      width: 380.w,
      color: kWhiteBackGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              child: FBoldText("Transaction Completed", kTextBlackColor, 18)),
          Container(
              margin: EdgeInsets.only(top: 18.w, left: 20.w),
              child: FRegularText(
                  "Thank you for using our service.", kGrey800Color, 14)),
        ],
      ),
    );
  }

  Widget _buildTimeInformation() {
    return Center(
      child: DealProcessWidget(
        step: dealResponse.dealState.getStep(),
        dealStartDateTime: ConverterUtil()
            .formatEnglishDateTime(dealResponse!.dealStartDateTime),
        depositRequestDateTime: ConverterUtil()
            .formatEnglishDateTime(dealResponse!.depositRequestDateTime),
        depositCompletionDateTime: ConverterUtil()
            .formatEnglishDateTime(dealResponse!.depositCompletionDateTime),
        dealCompletionRequestDateTime: ConverterUtil()
            .formatEnglishDateTime(dealResponse!.dealCompletionRequestDateTime),
        dealCompletionDateTime: ConverterUtil()
            .formatEnglishDateTime(dealResponse!.dealCompletionDateTime),
        dealCancellationDateTime: ConverterUtil()
            .formatEnglishDateTime(dealResponse!.dealCancellationDateTime),
      ),
    );
  }

  Widget _buildHomeInformation() {
    return Container(
      width: 380.w,
      color: kWhiteBackGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h, left: 20.w),
            child: FBoldText("매물 정보", kTextBlackColor, 14),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15.h, left: 0.w),
              width: 350.w,
              height: 200.h,
              decoration: BoxDecoration(
                border: Border.all(color: kGrey400Color),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13.w),
                    width: 140.w,
                    height: 170.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/test/home.png",
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: Column(
                      children: [
                        Container(
                          width: 170.w,
                          margin: EdgeInsets.only(top: 20.h),
                          child: FBoldText("Addresss", kTextBlackColor, 14),
                        ),
                        Container(
                          width: 170.w,
                          margin: EdgeInsets.only(top: 20.h),
                          child: FBoldText("Rent : 5000", kTextBlackColor, 13),
                        ),
                        Container(
                          width: 170.w,
                          margin: EdgeInsets.only(top: 20.h),
                          child: FBoldText("Bill : 500 ", kTextBlackColor, 13),
                        ),
                      ],
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
