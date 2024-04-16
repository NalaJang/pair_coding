import 'package:pair_coding/data/data_source/rate_api.dart';
import 'package:pair_coding/data/mapper/rate_mapper.dart';
import 'package:pair_coding/data/model/rate_model.dart';
import 'package:pair_coding/data/repository/rate_repository.dart';

class RateRepositoryImpl implements RateRepository {
  final RateApi _rateApi;

  RateRepositoryImpl({
    required RateApi rateApi,
  }) : _rateApi = rateApi;

  @override
  Future<Rate> getRate() async {
    final rates = await _rateApi.getRateDto();

    final rate = rates.toRate();

    return rate;
  }
}