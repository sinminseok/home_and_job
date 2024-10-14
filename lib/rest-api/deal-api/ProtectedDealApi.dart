import 'dart:convert';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/deal/request/ProtectedDealFindRequest.dart';
import '../../model/deal/request/ProtectedDealGeneratorRequest.dart';
import '../../model/deal/response/ProtectedDealGeneratorResponse.dart';
import '../../model/deal/response/ProtectedDealResponse.dart';
import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class ProtectedDealApi {
  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 안전거래 단일 조회 by Provider (In Chatting)
   */
  Future<List<ProtectedDealResponse>> loadProtectedDealByProvider(
      ProtectedDealFindRequest request) async {
    List<ProtectedDealResponse> deals = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");

    final response = await http.post(Uri.parse(ApiUrls.DEAL_PROVIDER_READ),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(request.toJson()));


    if (response.statusCode == 200) {
      deals = List<ProtectedDealResponse>.from(
          apiUtils.decodeResponse(response).map((x) => ProtectedDealResponse.fromJson(x))
      );
    }
    return deals;
  }



  /**
   * 안전거래 단일 조회 by Getter (In Chatting)
   */
  Future<List<ProtectedDealResponse>> loadProtectedDealByGetter(
      ProtectedDealFindRequest request) async {
    List<ProtectedDealResponse> deals = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");

    final response = await http.post(Uri.parse(ApiUrls.DEAL_GETTER_READ),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(request.toJson()));

    if (response.statusCode == 200) {
      deals = List<ProtectedDealResponse>.from(
          apiUtils.decodeResponse(response).map((x) => ProtectedDealResponse.fromJson(x))
      );
    }
    return deals;
  }

  /**
   * 안전 거래 시작 API (Provider 가 사용)
   */
  Future<int?> startDeal(
      ProtectedDealGeneratorRequest dealGeneratorRequest) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.post(
      Uri.parse(ApiUrls.DEAL_START_URL),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(dealGeneratorRequest.toJson()),
    );
    // 서버 응답 출력

    if (response.statusCode == 200) {
      ProtectedDealGeneratorResponse protectedDealGeneratorResponse = ProtectedDealGeneratorResponse.fromJson(RestApiUtils().decodeResponse(response));
      return protectedDealGeneratorResponse.dealId;
    }

    return null;
  }

  /**
   * 거래 수락 API (Getter 가 사용)
   */
  Future<bool> acceptDealByGetter(int dealId) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.post(
      Uri.parse(ApiUrls.DEAL_REQUEST_DEPOSIT_URL + dealId.toString()),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
    );

    // 서버 응답 출력
    if (response.statusCode == 200) {
      print("getter secretKey");
      String? secretKey = apiUtils.decodeResponse(response);
      print(secretKey);

      await DiskDatabase().setSecretKey(secretKey!);
      return true;
    }
    return false;
  }

  /**
   * 입금 신청 취소 API (Getter 가 사용)
   */
  Future<bool> cancelDepositByGetter(int dealId) async {
    var accessToken = await DiskDatabase().getAccessToken();
    
    var response = await apiUtils.patchResponse(ApiUrls.DEAL_CANCEL_DEPOSIT_URL + dealId.toString(), accessToken: accessToken);

    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }

  /**
   * 거래 완료 신청 API (GETTER 가 사용)
   */
  Future<bool> completeDeal(int dealId) async {
    String? accessToken = await DiskDatabase().getAccessToken();
    String? secretKey = await DiskDatabase().getSecretKey();

    var url = ApiUrls.DEAL_COMPLETE_URL.replaceAll("{dealId}", dealId.toString());

    Response response = await http.patch(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },

      body: jsonEncode(secretKey),
    );


    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  /**
   * 거래 취소 API
   */
  Future<bool> cancelDeal(int dealId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.patch(
      Uri.parse(ApiUrls.DEAL_CANCLE_URL + dealId.toString()),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
    );
    // 서버 응답 출력

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
