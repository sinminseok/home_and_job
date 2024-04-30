import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/procted-deal/provider-deal-generator/widgets/FinalDealInformationWidget.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../controller/ProtectedDealGeneratorController.dart';

class ProtectedDealGeneratorView extends StatelessWidget {
  ProtectedDealGeneratorController _controller;

  ProtectedDealGeneratorView(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: _buildStepOneButton(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            FinalDealInformationWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title2Text("거래 정보", kTextBlackColor),
        )
      ],
    );
  }

  SafeArea? _buildStepOneButton(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(),
            child: Container(
              width: double.infinity,
              color: kBlueColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide.none, // 테두리 없애기
                  shadowColor: Colors.transparent, // 그림자 없애기
                ),
                onPressed: () {
                  //_controller.ontapStep1Next();
                  // Get.to(() => ChargePointAccountView(), transition: Transition.rightToLeftWithFade);
                },
                child: ButtonText("완료", kWhiteBackGroundColor),
              ),
            )));
  }
}
