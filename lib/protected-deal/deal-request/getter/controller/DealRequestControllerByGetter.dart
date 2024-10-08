
import 'dart:async';

import 'package:get/get.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';

class DealRequestControllerByGetter extends GetxController{
  Rx<bool> _canNext = false.obs;

  void checkAgree(bool? value){
    _canNext.value = value!;
  }

  Future<bool> requestDeposit(int dealId)async{
    bool response = await ProtectedDealApi().requestDepositByGetter(dealId);
    if(response){
      return true;
    }
    return false;
  }

  Future<bool> cancelDeposit(int dealId) async {
    bool response = await ProtectedDealApi().cancelDepositByGetter(dealId);

    if(response) {
      return true;
    }
    return false;
  }



  bool get canNext => _canNext.value;
}