import 'package:pair_coding/data/dto/rate_dto.dart';
import 'package:pair_coding/data/model/rate_model.dart';

import '../model/conversion_rate.dart';

extension RateMapper on RateDto {
  Rate toRate() {

    final newConversionRates = conversionRates?.entries
        .map((entry) => ConversionRate(
              country: entry.key,
              rate: entry.value,
            ))
        .toList();

    return Rate(
      timeLastUpdateUtc: timeLastUpdateUtc ?? '',
      conversionRates: newConversionRates ?? [],
    );
  }
}
