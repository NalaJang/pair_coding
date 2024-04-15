import 'package:pair_coding/data/dto/real_time_station_arrival_dto.dart';
import 'package:pair_coding/data/model/subway_model.dart';

extension SubwayMapper on RealtimeArrivalList {
  SubwayModel toSubway() {
    return SubwayModel(
      subwayId: int.tryParse(subwayId ?? '') ?? -1,
      updnLine: updnLine ?? '',
      statnFid: statnFid ?? '',
      statnTid: statnTid ?? '',
      statnNm: statnNm ?? '',
      trainLineNm: trainLineNm ?? '',
      arrvalMessage: arvlMsg2 ?? '',
      btrainNo: int.tryParse(btrainNo ?? '') ?? -1,
      btrainSttus: btrainSttus ?? '',
      barvlDt: barvlDt ?? '',
      recptnDt: recptnDt ?? '',
    );
  }
}
