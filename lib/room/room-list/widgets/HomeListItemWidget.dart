import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeListItemWidget extends StatefulWidget {
  final HomeResponse? home;

  HomeListItemWidget(this.home);

  @override
  _HomeListItemWidgetState createState() => _HomeListItemWidgetState();
}

class _HomeListItemWidgetState extends State<HomeListItemWidget> {
  int _currentImageIndex = 0;
  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => RoomDetailView(widget.home!));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 450.h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 1.5,
              spreadRadius: 1.0,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHomeImages(),
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 370.w,
                    margin: EdgeInsets.only(top: 15.h),
                    child:
                    Title2Text("WAC 2000 멜버른 Street Name", kTextBlackColor),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: FBoldText("\$3000/200", kGrey800Color,16),
                      ),
                      Container(

                        width: 200.w,
                        margin: EdgeInsets.only(top: 15.h, left: 10.w),
                        child: FRegularText("(bond/perweek)", kGrey600Color,14),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: FRegularText("Station name / Clean Room / State is GOODDDD", kGrey700Color, 14)
                  ),

                  // Container(
                  //   margin: EdgeInsets.only(right: 15.w, top: 20.h),
                  //   width: 100.w,
                  //   height: 35.h,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(8)),
                  //     color: kDarkBlue,
                  //   ),
                  //   child: Center(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           child: Icon(
                  //             Icons.verified_user,
                  //             color: kWhiteBackGroundColor,
                  //             size: 18.sp,
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.only(right: 10.w, left: 5.w),
                  //           child: HintText2("안전거래", kWhiteBackGroundColor),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeImages() {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: [
            _buildImage("assets/images/test/home.png"),
            _buildImage("assets/images/test/home2.png"),
            _buildImage("assets/images/test/home.png"),
          ],
          options: CarouselOptions(
            height: 300.h,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "${_currentImageIndex + 1}/${3}",
              // Change 3 to the total number of images
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 100.h,
          left: 10.w,
          child: IconButton(
            color: kWhiteBackGroundColor,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _currentImageIndex = (_currentImageIndex - 1) %
                    3; // Change 3 to the total number of images
              });
              _carouselController.previousPage();
            },
          ),
        ),
        Positioned(
          top: 100.h,
          right: 10.w,
          child: IconButton(
            color: kWhiteBackGroundColor,
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                _currentImageIndex = (_currentImageIndex + 1) %
                    3; // Change 3 to the total number of images
              });
              _carouselController.nextPage();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      width: 380.w,
      height: 250.h,
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}