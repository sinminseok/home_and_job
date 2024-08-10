

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/rest-api/chat-api/ChatApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';

import '../../../model/chat/response/DirectMessageRoomListDto.dart';

class ChattingController extends GetxController {
  TextEditingController _filterController = TextEditingController();
  List<DirectMessageRoomListDto> _chatItems = [];
  late String _myUserId;


  Future<bool> loadAllDmList() async {
    _chatItems = await DmApi().loadDmList();
    _myUserId = (await DiskDatabase().getUserId())!;
    return true;
  }


  String get myUserId => _myUserId;

  List<DirectMessageRoomListDto> get chatItems => _chatItems;

  TextEditingController get filterController => _filterController;
}