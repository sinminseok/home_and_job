import 'package:intl/intl.dart';

class ConverterUtil{
  String? formatKoreanDateTime(DateTime? dateTime) {
    if(dateTime == null){
      return null;
    }
    final DateFormat formatter = DateFormat('yyyy년 M월 d일 HH:mm');
    return formatter.format(dateTime!);
  }

  String? formatEnglishDateTime(DateTime? dateTime) {
    if(dateTime == null){
      return null;
    }
    final DateFormat formatter = DateFormat('yyyy M/d HH:mm');
    return formatter.format(dateTime);
  }

  String formatChatDateTime(DateTime dateTime) {
    // 원하는 날짜 형식으로 포맷하기
    final DateFormat formatter = DateFormat('M/d a h:mm');
    return formatter.format(dateTime);
  }
}