
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

class GetterMapView extends StatefulWidget {
  const GetterMapView({Key? key}) : super(key: key);

  @override
  _GetterMapViewState createState() => _GetterMapViewState();
}

class _GetterMapViewState extends State<GetterMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(color: kWhiteBackGroundColor, canBack: true, title: "", ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
