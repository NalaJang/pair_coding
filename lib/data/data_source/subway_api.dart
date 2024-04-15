import '../dto/real_time_station_arrival_dto.dart';

abstract interface class SubwayApi {
  Future<RealTimeStationArrivalDto> getRealTimeStationArrival();
}