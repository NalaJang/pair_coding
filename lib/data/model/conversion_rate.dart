class ConversionRate {
   final String country;
  final num rate;

//<editor-fold desc="Data Methods">
  const ConversionRate({
    required this.country,
    required this.rate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversionRate &&
          runtimeType == other.runtimeType &&
          country == other.country &&
          rate == other.rate);

  @override
  int get hashCode => country.hashCode ^ rate.hashCode;

  @override
  String toString() {
    return 'ConversionRate{ country: $country, rate: $rate,}';
  }

  ConversionRate copyWith({
    String? country,
    num? rate,
  }) {
    return ConversionRate(
      country: country ?? this.country,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'rate': rate,
    };
  }

  factory ConversionRate.fromJson(Map<String, dynamic> json) {
    return ConversionRate(
      country: json['country'] as String,
      rate: json['rate'] as num,
    );
  }

//</editor-fold>
}