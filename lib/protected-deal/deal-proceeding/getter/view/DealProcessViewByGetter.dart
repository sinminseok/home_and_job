import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/utils/Converter.dart';
import '../../../../chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/enums/DealState.dart';
import '../../../../protected-deal/deal-request/getter/widgets/DepositInformationWidgetByGetter.dart';
import '../../../common/DealInformationWidgetByGetter.dart';
import '../controller/DealProcessControllerByGetter.dart';
import '../widgets/DealFinishAgreeWidget.dart';
import '../../common/widgets/DealProcessWidget.dart';
import '../../common/widgets/DepositGuideWidget.dart';

class DealProcessViewByGetter extends StatelessWidget {
  final int dealId;
  final ChatGetterDetailController _chatDetailController;
  final DealProcessControllerByGetter _controller =
      DealProcessControllerByGetter();

  DealProcessViewByGetter(this.dealId, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    final dealResponse = _chatDetailController.getDealById(dealId);
    final step = _getStep(dealResponse?.dealState);
    //final step = _getStep(dealResponse?.dealState);

    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: _filterButton(step, context),
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        canBack: true,
        title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                print(step);
              },
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 20.w),
                child: Title2Text("Transaction Status", kTextBlackColor),
              ),
            ),
            Center(
              child: DealProcessWidget(
                step: step,
                dealStartDateTime: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.dealStartDateTime),
                depositRequestDateTime: ConverterUtil().formatEnglishDateTime(
                    dealResponse!.depositRequestDateTime),
                depositCompletionDateTime: ConverterUtil()
                    .formatEnglishDateTime(
                        dealResponse!.depositCompletionDateTime),
                dealCompletionRequestDateTime: ConverterUtil()
                    .formatEnglishDateTime(
                        dealResponse!.dealCompletionRequestDateTime),
                dealCompletionDateTime: ConverterUtil().formatEnglishDateTime(
                    dealResponse!.dealCompletionDateTime),
                dealCancellationDateTime: ConverterUtil().formatEnglishDateTime(
                    dealResponse!.dealCancellationDateTime),
              ),
            ),
            Center(
                child: DealPriceWidget(
              deposit: dealResponse.deposit,
              fee: dealResponse.fee,
            )),
            DepositInformationWidgetByGetter(dealResponse!),
            if (step == 2) DealFinishAgreeWidget(_controller),
            SizedBox(
              height: 130.h,
            )
          ],
        ),
      ),
    );
  }

  int _getStep(DealState? dealState) {
    switch (dealState) {
      //입금 전
      case DealState.BEFORE_DEPOSIT:
        return 1;
      // 입금 신청
      case DealState.REQUEST_DEPOSIT:
        return 2;
      // 입금 완료
      case DealState.COMPLETE_DEPOSIT:
        return 3;
      //거래 완료 신청
      case DealState.REQUEST_COMPLETE_DEAL:
        return 4;
      // 입금 완료
      default:
        return 5;
    }
  }

  // Container _buildFinishDealWidget() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20.h, left: 20.w),
  //     child: Title2Text("거래가 완료 됐습니다.", kTextBlackColor),
  //   );
  // }

  Container _filterButton(int step, BuildContext context) {
    switch (step) {
      case 1:
        return _buildRequestDepositButton(context);
      case 2:
        return _buildNotTapButton("Transaction Completion Request");
      case 3:
        return _buildRequestCompleteRequestButton(context);
      default:
        return Container(
          height: 1.h,
        );
    }
  }

  Container _buildNotTapButton(String text) {
    return Container(
      width: double.infinity,
      color: kGrey200Color,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kGrey200Color,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {},
        child: ButtonText("${text}", kWhiteBackGroundColor),
      ),
    );
  }

  Container _buildRequestCompleteRequestButton(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          await ProtectedDealApi().requestDealFinish(dealId);
          _chatDetailController.confirmDeal();
          Navigator.pop(context);
        },
        child: ButtonText("Transaction Complete!", kWhiteBackGroundColor),
      ),
    );
  }

  Container _buildRequestDepositButton(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          await ProtectedDealApi().requestDepositByGetter(dealId);
          _chatDetailController.confirmDeal();
          Navigator.pop(context);
        },
        child: ButtonText("입금 신청", kWhiteBackGroundColor),
      ),
    );
  }
}
