import 'package:pair_coding/data/model/conversion_rate.dart';

class Rate {
  final String timeLastUpdateUtc;
  final List<ConversionRate> conversionRates;

//<editor-fold desc="Data Methods">
  const Rate({
    required this.timeLastUpdateUtc,
    required this.conversionRates,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rate &&
          runtimeType == other.runtimeType &&
          timeLastUpdateUtc == other.timeLastUpdateUtc &&
          conversionRates == other.conversionRates);

  @override
  int get hashCode => timeLastUpdateUtc.hashCode ^ conversionRates.hashCode;

  @override
  String toString() {
    return 'Rate{ timeLastUpdateUtc: $timeLastUpdateUtc, conversionRates: $conversionRates,}';
  }

  Rate copyWith({
    String? timeLastUpdateUtc,
    List<ConversionRate>? conversionRates,
  }) {
    return Rate(
      timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
      conversionRates: conversionRates ?? this.conversionRates,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeLastUpdateUtc': timeLastUpdateUtc,
      'conversionRates': conversionRates,
    };
  }

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      timeLastUpdateUtc: json['timeLastUpdateUtc'] as String,
      conversionRates: json['conversionRates'] as List<ConversionRate>,
    );
  }

//</editor-fold>
}
