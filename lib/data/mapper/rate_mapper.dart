import 'package:pair_coding/data/dto/rate_dto.dart';
import 'package:pair_coding/data/model/rate_model.dart';

extension RateMapper on RateDto {

  Rate toRate() {
    return Rate(country: country, rate: rate,)
  }
}
