import 'package:freezed_annotation/freezed_annotation.dart';

part 'PointChargeHistoryResponse.freezed.dart';
part 'PointChargeHistoryResponse.g.dart';

@freezed
class PointChargeHistoryResponse with _$PointChargeHistoryResponse {
  const factory PointChargeHistoryResponse({
    required int chargeAmount,
    required DateTime chargeDate,
  }) = _PointChargeHistoryResponse;

  factory PointChargeHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PointChargeHistoryResponseFromJson(json);
}