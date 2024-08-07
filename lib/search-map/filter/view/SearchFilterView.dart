
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/filter/Filter.dart';
import 'package:home_and_job/search-map/filter/controller/FilterController.dart';
import 'package:home_and_job/search-map/filter/widgets/PriceFilterWidget.dart';
import 'package:home_and_job/search-map/filter/widgets/RoomTypeFilterWidget.dart';

class SearchFilterView extends StatefulWidget {
  Filter? _preFilter;


  SearchFilterView(this._preFilter);

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  FilterController? _controller;

  @override
  void initState() {
    _controller = FilterController(widget._preFilter);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: _buildAppBar(context),
      //bottomSheet: _buildSearchButton(),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                RoomTypeFilterWidget(_controller!),
                PriceFilterWidget(_controller!),
              ],
            ),
            _buildSearchButton(context, _controller!),
          ],
        ),
      ),
    );
  }



  Widget _buildSearchButton(BuildContext context, FilterController _controller){
    return InkWell(

      onTap: (){
        Navigator.pop(context, _controller.createFilter());
      },
      child: Container(
        width: 340.w,
        height: 45.h,
        margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: kDarkBlue,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Center(
          child: FBoldText("Search", kWhiteBackGroundColor, 15),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kWhiteBackGroundColor,
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(Icons.close),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13.w),
              child: Title2Text("Filter", kGrey800Color),
            ),
            Container()
          ],
        ),
      )
    );
  }
}
