

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

class ReservationExampleView extends StatelessWidget {
  const ReservationExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteColor),
    );
  }
}
