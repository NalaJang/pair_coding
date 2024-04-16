import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/model/rate_model.dart';
import 'package:pair_coding/data/repository/rate_repository.dart';

class RateViewModel with ChangeNotifier {
  final RateRepository repository;
 late Rate _rate ;


  RateViewModel({
    required this.repository,
  });



  void getRate() async {
    _rate = await repository.getRate();

    notifyListeners();

  }

  void selectedCountry() async {

  }
}
