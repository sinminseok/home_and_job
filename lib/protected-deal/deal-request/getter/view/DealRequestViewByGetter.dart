import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../deal-generator/widgets/DealInformationHeaderWidget.dart';
import '../controller/DealRequestControllerByGetter.dart';
import '../widgets/DealRequestAgreeWidget.dart';
import '../widgets/DepositInformationWidgetByGetter.dart';
import '../widgets/DealInformationWidgetByGetter.dart';

/**
 * Getter 에게 보여줄 입금 요청 View
 */
class DealRequestViewByGetter extends StatelessWidget {

  ChatDetailController _chatDetailController;
  DealRequestControllerByGetter _controller =
      DealRequestControllerByGetter();


  DealRequestViewByGetter(this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildStepOneButton(context),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //매물 정보
            DealInformationHeaderWidget(),
            //거래 정보
            Center(child: DealInformationWidgetByGetter()),
            //입금 계좌
            DepositInformationWidgetByGetter(),
            //이용약관 도으이
            DealRequestAgreeWidget(controller: _controller),
            Container(
              height: 130.h,
            )
          ],
        ),
      ),
    );
  }

  Obx _buildStepOneButton(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      color: _controller.canNext ? kBlueColor : kGrey200Color,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor:
          _controller.canNext ? kBlueColor : kGrey200Color,
          //padding: EdgeInsets.symmetric(vertical: 14),
          side: BorderSide.none, // 테두리 없애기
          shadowColor: Colors.transparent, // 그림자 없애기
        ),
        onPressed: () {
          if(_controller.canNext){
            _chatDetailController.applyDeposit();
            Navigator.pop(context);
          }
        },
        child: ButtonText("입금 신청", kWhiteBackGroundColor),
      ),
    ));
  }
}
