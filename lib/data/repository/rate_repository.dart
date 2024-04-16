import 'package:pair_coding/data/model/rate_model.dart';

abstract interface class RateRepository {
  Future<Rate> getRate();
}
