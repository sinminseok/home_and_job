import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/chatting/main/view/ChattingListView.dart';
import 'package:home_and_job/common-widgets/app-bar/BottomNavigationBar.dart';
import 'package:home_and_job/my-profile/main/view/MyProfileView.dart';

import '../../../favorite/main/view/FavoriteView.dart';
import '../view/MainView.dart';




class MainFrameView extends StatefulWidget {
  final int index;

  MainFrameView(this.index);

  @override
  _MainFrameView createState() => _MainFrameView();
}

class _MainFrameView extends State<MainFrameView> {
  var authority;

  late int admin_selectedItem;

  @override
  void initState() {
    admin_selectedItem = widget.index;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final admin_screens = [
      MainView(),
      FavoriteView(),
      ChattingListView(),
      MyProfileView(),
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationWidget(
          widget.index,
              (val) {
            setState(() {
              admin_selectedItem = val;
            });
          },
          [
            Icons.search,
            Icons.favorite_outline_sharp,
            Icons.messenger_outline,
            Icons.account_circle_sharp
          ],
          ["Search", "ShortList", "Messages", "Profile"],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}