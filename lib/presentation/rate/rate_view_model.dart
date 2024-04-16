import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/model/rate_model.dart';
import 'package:pair_coding/data/repository/rate_repository.dart';

class RateViewModel with ChangeNotifier {
  final RateRepository repository;
  String _dropdownValue = '';
  Rate _rate = const Rate(timeLastUpdateUtc: '', conversionRates: []);
  final _inputController = TextEditingController();
  final _outputController = TextEditingController();

  RateViewModel({
    required this.repository,
  });

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  Rate get rate => _rate;

  String get dropdownValue => _dropdownValue;

  get inputController => _inputController;

  get outputController => _outputController;

  void getRate() async {
    _rate = await repository.getRate();
    _dropdownValue = _rate.conversionRates.first.country;

    notifyListeners();
  }

  void changeCountry(String value) {
    _dropdownValue = value;
    notifyListeners();
  }
}
