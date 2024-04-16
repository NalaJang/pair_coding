import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/model/rate_model.dart';
import 'package:pair_coding/data/repository/rate_repository.dart';

class RateViewModel with ChangeNotifier {
  final RateRepository repository;
  Rate _rate = const Rate(timeLastUpdateUtc: '', conversionRates: []);

  RateViewModel({
    required this.repository,
  });

  Rate get rate => _rate;

  void getRate() async {
    _rate = await repository.getRate();
    // print(_rate.conversionRates.length);

    notifyListeners();
  }

  void selectedCountry() async {}
}
