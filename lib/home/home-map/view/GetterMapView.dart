
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

class HomeMapView extends StatelessWidget {
  const HomeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(color: kWhiteBackGroundColor, canBack: true,title: "",),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
