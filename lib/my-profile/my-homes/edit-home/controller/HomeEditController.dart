import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/model/home/request/HomeUpdateRequest.dart';
import 'package:home_and_job/model/user/enums/Gender.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/view/HomeEditFinishView.dart';
import 'package:home_and_job/rest-api/home-api/MyHomeApi.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/home-api/RoomApi.dart';
import 'package:home_and_job/utils/Popup.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../model/home/enums/HomeOption.dart';
import '../../../../model/home/enums/HomeType.dart';
import '../../../../model/home/request/HomeAddressGeneratorRequest.dart';
import '../../../../model/home/response/HomeInformationResponse.dart';
import '../../../../model/home/response/HomeOverviewResponse.dart';
import '../../../../model/home/response/LatLng.dart';
import '../../../../rest-api/home-api/HomeRegisterApi.dart';
import '../../../../search/search-address/model/SearchCityModel.dart';
import '../../../../search/search-address/view/SearchAddressView.dart';

class HomeEditController extends GetxController {
  late HomeInformationResponse _home;

  // HomeType
  final Rx<HomeType> _selectedHomeType = HomeType.NONE.obs;
  RxList _homeImages = [].obs;
  RxList _addImages = [].obs;

  List<String> _deleteImagesUrls = [];
  Rx<String> _homeAddress = "".obs;
  HomeAddressGeneratorRequest? _newAddress;
  TextEditingController _bondController = TextEditingController();
  TextEditingController _rentController = TextEditingController();
  TextEditingController _billController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();

  final RxList<HomeOptionType> _selectedOptions = <HomeOptionType>[].obs;

  Future<bool> loadInit(int homeIdx) async {
    _home = (await RoomApi().loadRoomById(homeIdx))!;
    _homeAddress.value = _home.address!;
    _introduceController = TextEditingController(text: _home.introduce);
    _bondController = TextEditingController(text: _home.bond.toString());
    _rentController = TextEditingController(text: _home.rent.toString());
    _billController = TextEditingController(text: _home.bill.toString());
    initImages(_home.images!);
    initOptions(_home.options!);
    return true;
  }

  void initOptions(String strings) {
    List<HomeOptionType> parseHomeOptionTypes2 = parseHomeOptionTypes(strings);
    _selectedOptions.addAll(parseHomeOptionTypes2);
  }

  void initImages(List<String> _initImages) {
    _homeImages.addAll(_initImages);
  }

  void addHomeImages() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile> resultList = [];
    resultList = await imagePicker.pickMultiImage();
    _addImages.value = resultList;
    List<String> imagePaths = resultList.map((image) => image.path).toList();
    _homeImages.addAll(imagePaths);
  }

  void soldOut() async {
    bool response =
        await MyHomeApi().changeStatus(HomeStatus.SOLD_OUT, _home.homeId!);
    if (response) {
      Get.offAll(() => FinishView("Congratulations on selling your house!",
          "Touch to return to the main screen."));
    }
  }

  void deleteHomeImages(String path) {
    if (_homeImages.contains(path)) {
      _deleteImagesUrls.add(path);
      _homeImages.remove(path);
    }
  }

  void updateAddress(HomeAddressGeneratorRequest newAddress) {
    _newAddress = newAddress;
    _homeAddress.value = toAddressString(newAddress);
  }

  String toAddressString(HomeAddressGeneratorRequest addressGeneratorRequest) {
    return '${addressGeneratorRequest.streetCode} ${addressGeneratorRequest.streetName} , ${addressGeneratorRequest.city}  ${addressGeneratorRequest.state}  ${addressGeneratorRequest.postCode} ';
  }

  void toggleOption(HomeOptionType option) {
    _selectedOptions.contains(option)
        ? _selectedOptions.remove(option)
        : _selectedOptions.add(option);
  }

  void selectHomeType(HomeType type) {
    _selectedHomeType.value = type;
  }

  void updateHomeImage() async {}

  void updateHomeInformation() async {
    if (!validateImageCount()) {
      ToastMessage().showtoast("At least one photo of the house is required");
    } else {
      //todo 이미지 업데이트
      if (_addImages.value.length >= 0) {
        await MyHomeApi().updateHomeImages(_home.homeId!, extractImageUrls());
      }
      if (_deleteImagesUrls.length >= 0) {
        await MyHomeApi().deleteHomeImages(home.homeId!, _deleteImagesUrls);
      }
      //todo 정보 업데이트
      var homeUpdateRequest = createHomeUpdateRequest();
      var response = await MyHomeApi().updateHomeInformation(homeUpdateRequest);
      if (response) {
        Get.to(() => HomeEditFinishView());
      }
    }
  }

  List<String> extractImageUrls() {
    List<String> paths = [];
    for (int i = 0; i < _addImages.length; i++) {
      paths.add(addImages[i].path);
    }
    return paths;
  }

  bool validateImageCount() {
    if (_homeImages.length == 0) {
      return false;
    }
    return true;
  }

  // 업데이트할 집 정보를 담을 객체
  HomeUpdateRequest createHomeUpdateRequest() {
    return HomeUpdateRequest(
        homeId: _home.homeId,
        bathRoomCount: _home.bathRoomCount,
        dealSavable: true,
        bedroomCount: _home.bedroomCount,
        bond: int.parse(_bondController.text),
        gender: _home.gender,
        type: _home.type,
        introduce: _introduceController.text,
        bill: int.parse(_billController.text),
        rent: int.parse(_rentController.text),
        options: parseHomeTypeString(_selectedOptions),
        homeAddress: _newAddress != null ? _newAddress : null);
  }

  String get homeAddress => _homeAddress.value;

  HomeInformationResponse get home => _home;

  TextEditingController get billController => _billController;

  TextEditingController get rentController => _rentController;

  TextEditingController get bondController => _bondController;

  TextEditingController get introduceController => _introduceController;

  HomeType get selectedHomeType => _selectedHomeType.value;

  HomeAddressGeneratorRequest? get newAddress => _newAddress;

  RxList<HomeOptionType> get selectedOptions => _selectedOptions;

  List get addImages => _addImages.value;

  List<String> get deleteImagesUrls => _deleteImagesUrls;

  List get homeImages => _homeImages.value;
}
