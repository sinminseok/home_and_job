import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-deals/main/view/MyDealListView.dart';
import 'package:home_and_job/my-profile/notice/view/NoticeView.dart';
import 'package:home_and_job/my-profile/policies/view/PoliciesView.dart';
import 'package:home_and_job/my-profile/question/view/QuestionView.dart';
import 'package:home_and_job/my-profile/safe-deal-explanation/view/SafeDealExplacationView.dart';
import 'package:home_and_job/point/register-account/view/RegisterAccountView.dart';
import 'package:home_and_job/rest-api/user-api/ProfileDetailApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import '../../../point/charge-point/main/view/ChargePointView.dart';
import '../../../point/my-point/view/MyPointView.dart';
import '../../../register-home/view/StartRegisyerView.dart';
import '../../../rest-api/user-api/UserPointApi.dart';
import '../../../save-deal/view/SaveDealGuildLineView.dart';
import '../../my-homes/main/view/MyHomeListView.dart';
import '../controller/MyProfileController.dart';

class SettingListWidget extends StatelessWidget {
  MyProfileController _controller;


  SettingListWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        height: 1135.h,
        decoration: BoxDecoration(
          color: kWhiteBackGroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 20.h),
              child: FBoldText("News", kTextBlackColor,14),
            ),
            _buildNotice(),
            _buildDealInformation(),
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 20.h),
              child: FBoldText("Point", kTextBlackColor,14),
            ),
            _buildMyPoints(),
            _buildChargePoint(),

            _buildLine(),
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 20.h),
              child: FBoldText("My Rooms", kTextBlackColor,14),
            ),
            _myRoomItem(),
            _registerMyHomeItem(),
            _buildLine(),
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 20.h),
              child: FBoldText("My Deals", kTextBlackColor,14),
            ),
            _buildMyDeal(),
            _buildLine(),
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 20.h),
              child: FBoldText("Etc", kTextBlackColor,14),
            ),
            _buildQuestion(),
            _buildPolices(),
            _buildCustomerSupport(),

            Container(
              margin: EdgeInsets.only(left: 15.w, top: 20.h),
              child: FBoldText("Account", kTextBlackColor,14),
            ),
            _buildLogout(context),
            _buildWithDraw(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion() {
    return InkWell(
      onTap: () {
        Get.to(() => QuestionView());
        //Get.to(() => RegisterHomeImageView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: FRegularText("Frequently Asked Questions", kTextBlackColor, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPolices() {
    return InkWell(
      onTap: () {
        Get.to(() => PoliciesView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: FRegularText("Terms and Policies", kTextBlackColor, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerSupport() {
    return InkWell(
      onTap: () {
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: FRegularText("Customer Service", kTextBlackColor, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLogout(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.logOut(context);
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: FRegularText("Log Out", kTextBlackColor, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.logout,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWithDraw() {
    return InkWell(
      onTap: () {
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: FRegularText("With Draw", kTextBlackColor, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.cancel_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLine(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 340.w,
        height: 1.h,
        color: kGrey200Color,
      ),
    );
  }

  Widget _buildNotice() {
    return InkWell(
      onTap: () {
        Get.to(() => NoticeView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(Icons.notifications_none_outlined, size: 20.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: FRegularText("Notice", kTextBlackColor, 15),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
                color: kDarkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMyPoints() {
    return InkWell(
      onTap: () async{
        var userAccount = await UserPointApi().loadUserAccount();
        if(userAccount == null){
          Get.to(() => RegisterAccountView());
        }else{
          Get.to(() => MyPointView(userAccount));
        }
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(Icons.trending_up, size: 20.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: FRegularText("My Points", kTextBlackColor, 15),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
                color: kDarkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChargePoint() {
    return InkWell(
      onTap: () async{
        var userId = await DiskDatabase().getUserId();
        var userAccount = await UserPointApi().loadUserAccount();
        if(userAccount == null){
          Get.to(() => RegisterAccountView());
        }else{
          Get.to(() => ChargePointView(userAccount, null));
        }
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(Icons.paid_outlined, size: 20.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: FRegularText("Charge Point", kTextBlackColor, 15),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
                color: kDarkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDealInformation() {
    return InkWell(
      onTap: () {
        Get.to(() => SaveDealGuideLineView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(Icons.lock_outline, size: 20.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: FRegularText("What is Safe transaction", kTextBlackColor, 15),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
                color: kDarkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _myRoomItem() {
    return InkWell(
      onTap: () {
        Get.to(() => MyHomeListView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(Icons.home_outlined, size: 20.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: FRegularText("My Rooms", kTextBlackColor, 15),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
                color: kDarkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerMyHomeItem() {
    return InkWell(
      onTap: () {
        Get.to(() => StartRegisterView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             children: [
               Container(
                 child: Icon(Icons.post_add, size: 20.sp,),
               ),
               Container(
                 margin: EdgeInsets.only(left: 5.w),
                 child: FRegularText("Register My Room", kTextBlackColor, 15),
               ),
             ],
           ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMyDeal() {
    return InkWell(
      onTap: () {
        Get.to(() => MyDealListView());
        //Get.to(() => RegisterHomeImageView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  child: Icon(Icons.sync_alt, size: 20.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: FRegularText("History of Deals", kTextBlackColor, 15),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buyHistory() {
    return InkWell(
      onTap: () {
        Get.to(() => StartRegisterView());
        //Get.to(() => RegisterHomeImageView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w),
              child: FRegularText("History of buy Room", kDarkBlue, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

}
