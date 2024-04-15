import 'dart:convert';

import 'package:pair_coding/data/data_source/subway_api.dart';
import 'package:http/http.dart' as http;
import 'package:pair_coding/data/dto/real_time_station_arrival_dto.dart';


class SubwayApiImpl implements SubwayApi {
  @override
  Future<RealTimeStationArrivalDto> getRealTimeStationArrival() async{
    final response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8'));

    return RealTimeStationArrivalDto.fromJson(jsonDecode(response.body));
  }
}
