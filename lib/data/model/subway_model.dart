class SubwayModel {
  final num subwayId;
  final String updnLine;
  final String statnFid; // 이전 역 이름
  final String statnTid; // 다음 역 이름
  final String statnNm;     // 현재 역 이름
  final String trainLineNm; // 종착 지하철 역 이름
  final String arrvalMessage;
  final num btrainNo; // 열차 번호
  final String btrainSttus; // 열차 종류
  final String barvlDt; // 열차 도착 예정 시간
  final String recptnDt; // 열차 도착 정보를 생성한 시각

  const SubwayModel({
    required this.subwayId,
    required this.updnLine,
    required this.statnFid,
    required this.statnTid,
    required this.statnNm,
    required this.trainLineNm,
    required this.arrvalMessage,
    required this.btrainNo,
    required this.btrainSttus,
    required this.barvlDt,
    required this.recptnDt,
  });

  Map<String, dynamic> toJson() {
    return {
      'subwayId': this.subwayId,
      'updnLine': this.updnLine,
      'statnFid': this.statnFid,
      'statnTid': this.statnTid,
      'statnNm': this.statnNm,
      'trainLineNm': this.trainLineNm,
      'arrvalMessage': this.arrvalMessage,
      'btrainNo': this.btrainNo,
      'btrainSttus': this.btrainSttus,
      'barvlDt': this.barvlDt,
      'recptnDt': this.recptnDt,
    };
  }

  factory SubwayModel.fromJson(Map<String, dynamic> json) {
    return SubwayModel(
      subwayId: json['subwayId'] as num,
      updnLine: json['updnLine'] as String,
      statnFid: json['statnFid'] as String,
      statnTid: json['statnTid'] as String,
      statnNm: json['statnNm'] as String,
      trainLineNm: json['trainLineNm'] as String,
      arrvalMessage: json['arrvalMessage'] as String,
      btrainNo: json['btrainNo'] as num,
      btrainSttus: json['btrainSttus'] as String,
      barvlDt: json['barvlDt'] as String,
      recptnDt: json['recptnDt'] as String,
    );
  }

}