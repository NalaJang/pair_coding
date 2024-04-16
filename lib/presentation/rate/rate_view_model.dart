import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/repository/rate_repository.dart';

class RateViewModel with ChangeNotifier {
  final RateRepository repository;


  RateViewModel({
    required this.repository,
  });

  void getRate() async {
    final rateData = await repository.getRate();
  }

  void selectedCountry() async {

  }
}
