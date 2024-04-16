class Rate{
  final String timeLastUpdateUtc;
  final String country;
  final String rate;

//<editor-fold desc="Data Methods">
  const Rate({
    required this.country,
    required this.rate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rate &&
          runtimeType == other.runtimeType &&
          country == other.country &&
          rate == other.rate);

  @override
  int get hashCode => country.hashCode ^ rate.hashCode;

  @override
  String toString() {
    return 'Rate{ country: $country, rate: $rate,}';
  }

  Rate copyWith({
    String? country,
    String? rate,
  }) {
    return Rate(
      country: country ?? this.country,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': this.country,
      'rate': this.rate,
    };
  }

  factory Rate.fromJson(Map<String, dynamic> map) {
    return Rate(
      country: map['country'] as String,
      rate: map['rate'] as String,
    );
  }

//</editor-fold>
}