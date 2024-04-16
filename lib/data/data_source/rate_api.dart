import 'package:pair_coding/data/dto/rate_dto.dart';


abstract interface class RateApi {
  Future<RateDto> getRateDto();
}