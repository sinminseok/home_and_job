import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:home_and_job/account/login/view/MainLoginView.dart';
import 'package:home_and_job/model/user/enums/Gender.dart';
import 'package:home_and_job/rest-api/account-api/AccountApi.dart';
import 'package:home_and_job/rest-api/user-api/SignupApi.dart';
import 'package:home_and_job/model/user/enums/SignupType.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../view/SuccessSignupView.dart';

class SignupController extends GetxController {
  Rx<int> _step = 1.obs;
  Rx<bool> _canInputCode = false.obs;

  // 각각 뷰에서 버튼 클릭 여부를 판별할 변숭
  Rx<bool> _checkEmail = false.obs;
  Rx<bool> _checkPrivacy = false.obs;
  Rx<bool> _checkDetail = false.obs;
  // Rx<String> _selectGender = "".obs;

  String email = "";
  String selectGender = "";
  String selectCountry = "";
  String _profileUrl = "";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _emailCheckController = TextEditingController();

  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _pwCheckController = TextEditingController();
  TextEditingController _jobController = TextEditingController();

  void ontapEmailButton() {
    _step.value = 2;
  }

  void ontapPrivacyButton() {
    _step.value = 3;
  }

  void signupEmailAccount() async {
    var signupRequest = SignupRequest(
        email: _emailController.text,
        password: _pwController.text,
        nickname: _nameController.text,
        phoneNumber: "01012341234",
        gender: parseGender(selectGender).name,
        job: _jobController.text,
        nationality: selectCountry,
        signupType: SignupType.EMAIL.name);

    bool response = await SignupApi()
        .signupApi(signupRequest, _profileUrl == "" ? null : _profileUrl);

    if (response) {
      Get.to(() => SuccessSignupView());
    } else {}
  }

  void signupOAuthAccount(SignupType signupType, String email) async {

    var signupRequest = SignupRequest(
        email: email,
        password: "",
        nickname: _nameController.text,
        phoneNumber: "01012341234",
        gender: parseGender(selectGender).name,
        job: _jobController.text,
        nationality: selectCountry,
        signupType: signupType.name);

    bool response = await SignupApi()
        .signupGoogleApi(signupRequest, _profileUrl == "" ? null : _profileUrl);

    if (response) {
      Get.to(() => SuccessSignupView());
    } else {}
  }

  void checkEmailCode(BuildContext context) async {
    if (emailCheckController.text.length != 6) {
      CustomSnackBar()
          .show(context, "The verification code is 6 characters long.");
    } else {
      bool result = await AccountApi()
          .verifySignUpCode(_emailController.text, _emailCheckController.text);
      if (result) {
        _checkEmail.value = true;
      } else {
        CustomSnackBar().show(context, "Verification failed.");
      }
    }
  }



  // 이메일 인증코드 요청 메서드
  void sendEmail(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      CustomSnackBar().show(context, "Input your email");
    } else {
      bool duplicateEmail = await AccountApi().checkDuplicateEmail(_emailController.text);
      if(!duplicateEmail){
        CustomSnackBar().show(context, "The email already exists.");
        return;
      }

      bool result =
          await AccountApi().sendCheckCodeToEmail(_emailController.text);
      if (result) {
        email = _emailController.text;
        _canInputCode.value = true;
      } else {
        CustomSnackBar().show(context, "Failed to send Email");
      }
    }
  }

  // 비밀번호 길이 8 자리 이상
  void validatePrivacy() {
    if (_pwCheckController.text.length >= 7 &&
        (_pwController.text == _pwCheckController.text)) {
      _checkPrivacy.value = true;
    } else {
      _checkPrivacy.value = false;
    }
  }

  void validateUserDetail() {
    if (_nameController.text.length >= 1 && selectGender != "" &&
        selectGender != "" &&
        _jobController.text != "") {
      _checkDetail.value = true;
    } else {
      _checkDetail.value = false;
    }
  }

  void setEmail(String oauthEmail){
    email = oauthEmail;
  }

  void selectImage(String path) {
    _profileUrl = path;
  }

  void ontapGender(String value) {
    selectGender = value;
  }

  void ontapCountry(String value) {
    selectCountry = value;
  }

   Gender parseGender(String value) {
    switch (value.toLowerCase()) {
      case 'male':
        return Gender.MALE;
      case 'female':
        return Gender.FEMALE;
      case 'anything':
        return Gender.ANYTHING;
      default:
        throw ArgumentError('Unknown gender: $value');
    }
  }

  void selectProfileImage() {}

  bool get canInputCode => _canInputCode.value;

  int get step => _step.value;

  bool get checkDetail => _checkDetail.value;

  bool get checkPrivacy => _checkPrivacy.value;

  bool get checkEmail => _checkEmail.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get idController => _idController;

  TextEditingController get pwController => _pwController;

  TextEditingController get pwCheckController => _pwCheckController;

  TextEditingController get emailController => _emailController;

  TextEditingController get emailCheckController => _emailCheckController;

  TextEditingController get jobController => _jobController;

  String get profileUrl => _profileUrl;

}
