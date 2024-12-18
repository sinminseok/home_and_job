import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../controller/DealGeneratorController.dart';
import '../../common/HomeInformationByDealWidget.dart';
import '../widgets/DealDateTimePickWidget.dart';
import '../widgets/ProviderAccountFormWidget.dart';
import 'DealGeneratorFinalViewByProvider.dart';

/**
 * Provider 가 안전 거래를 생성하는 화면
 */
class DealGeneratorViewByProvider extends StatelessWidget {
  ChatProviderDetailController _chatController;
  DealGeneratorController _controller =
      DealGeneratorController();


  DealGeneratorViewByProvider(this._chatController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      resizeToAvoidBottomInset: true,
      bottomSheet: _buildStepOneButton(context),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom +
              30.h, // 키보드가 올라올 때 여백 추가
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeInformationByDealWidget(_chatController.home.images!.first, _chatController.home.address!, _chatController.home.rent!, _chatController.home.bond!),
            ProviderAccountFormWidget(_controller),
            DealDateTimePickWidget(_controller),
          ],
        ),
      ),
    );
  }

  Widget? _buildStepOneButton(BuildContext context) {
    return Obx(() => SafeArea(

      child: Padding(
          padding: EdgeInsets.only(),
          child: _controller.finishAccountInformation
              ? Container(
            height: 70.h,
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
                Get.to(
                      () => DealGeneratorFinalViewByProvider(_controller, _chatController),
                );
              },
              child: ButtonText("Next", kWhiteBackGroundColor),
            ),
          )
              : null),
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kWhiteBackGroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            child: Body2Text("What is safe transaction ?", kBlueColor),
          )
        ],
      ),
    );
  }
}
