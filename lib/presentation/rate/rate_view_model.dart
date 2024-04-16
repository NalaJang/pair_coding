import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/model/rate_model.dart';
import 'package:pair_coding/data/repository/rate_repository.dart';

class RateViewModel with ChangeNotifier {
  final RateRepository repository;
  String _inputDropdownValue = '';
  String _outputDropdownValue = '';
  Rate _rate = const Rate(timeLastUpdateUtc: '', conversionRates: []);
  final _inputController = TextEditingController();
  final _outputController = TextEditingController();
  num _outputPrice = 0;
  num _inputPrice = 0;

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

  String get inputDropdownValue => _inputDropdownValue;

  String get outputDropdownValue => _outputDropdownValue;

  get inputController => _inputController;

  get outputController => _outputController;

  void getRate() async {
    _rate = await repository.getRate();
    _inputDropdownValue = _rate.conversionRates.first.country;
    _outputDropdownValue = _rate.conversionRates.first.country;

    notifyListeners();
  }

  void changeCountry(String value, bool isInput) {
    isInput ? _inputDropdownValue = value : _outputDropdownValue = value;
    notifyListeners();
  }

  void calculateRate() {
    final inputRate = _rate.conversionRates
        .firstWhere((element) => element.country == inputDropdownValue);

    final outputRate = _rate.conversionRates
        .firstWhere((element) => element.country == outputDropdownValue);

    final outPutPrice =
        (num.tryParse(_inputController.text) ?? 0 / inputRate.rate) *
            outputRate.rate;



    /// 1. 나라 이름으로 환율을 찾는다.
    /// 2. (인풋 가격 / 인풋 기본 가격) = 배 수 X 아웃풋 나라 환율

  }
}
