class RateDto {
  RateDto({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  String? result;
  String? documentation;
  String? termsOfUse;
  num? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  num? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  List<Map<String, dynamic>>? conversionRates;

  RateDto.fromJson(dynamic json) {
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = json['conversion_rates'].forEach((currency, rate) {
      conversionRates?.add({
        'currency': currency,
        'rate': rate,
      });
    });
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['documentation'] = documentation;
    map['terms_of_use'] = termsOfUse;
    map['time_last_update_unix'] = timeLastUpdateUnix;
    map['time_last_update_utc'] = timeLastUpdateUtc;
    map['time_next_update_unix'] = timeNextUpdateUnix;
    map['time_next_update_utc'] = timeNextUpdateUtc;
    map['base_code'] = baseCode;
    if (conversionRates != null) {
      map['conversion_rates'] = conversionRates;
    }
    return map;
  }
}
