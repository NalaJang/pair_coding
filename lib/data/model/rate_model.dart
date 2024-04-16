class Rate {
  final String timeLastUpdateUtc;
  final List<Map<String,dynamic>> conversionRates;

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
    List<Map<String, dynamic>>? conversionRates,
  }) {
    return Rate(
      timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
      conversionRates: conversionRates ?? this.conversionRates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timeLastUpdateUtc': timeLastUpdateUtc,
      'conversionRates': conversionRates,
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      timeLastUpdateUtc: map['timeLastUpdateUtc'] as String,
      conversionRates: map['conversionRates'] as List<Map<String, dynamic>>,
    );
  }

//</editor-fold>
}
