import 'package:pair_coding/data/data_source/subway_api.dart';
import 'package:pair_coding/data/mapper/subway_mapper.dart';
import 'package:pair_coding/data/model/subway_model.dart';
import 'package:pair_coding/data/repository/subway_arrival_repository.dart';

class SubwayArrivalRepositoryImpl implements SubwayArrivalRepository {
  final SubwayApi _subwayApi;

  const SubwayArrivalRepositoryImpl({
    required SubwayApi subwayApi,
  }) : _subwayApi = subwayApi;

  @override
  Future<List<SubwayModel>> getArrivals() async {
    List<SubwayModel> dataList = [];
    final subwayData = await _subwayApi.getRealTimeStationArrival();

    if (subwayData.realtimeArrivalList == null) {
      return dataList;
    }
    dataList =
        subwayData.realtimeArrivalList!.map((e) => e.toSubway()).toList();

    return dataList;
  }
}
