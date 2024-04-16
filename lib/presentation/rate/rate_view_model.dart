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
  num _inputPrice = 0;
  num _outputPrice = 0;

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

  num get inputPrice => _inputPrice;

  num get outputPrice => _outputPrice;

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

  void calculateOutputRate() {
    /// 1. 나라 이름으로 환율을 찾는다.
    /// 2. (인풋 가격 / 인풋 기본 가격) = 배 수 X 아웃풋 나라 환율
    final inputRate = _rate.conversionRates
        .firstWhere((element) => element.country == inputDropdownValue);

    final outputRate = _rate.conversionRates
        .firstWhere((element) => element.country == outputDropdownValue);

    _outputPrice = (num.tryParse(_inputController.text) ?? 0 / inputRate.rate) *
        outputRate.rate;

    _outputController.text = _outputPrice.toString();

    notifyListeners();
  }

  void calculateInputRate() {
    /// 1. 나라 이름으로 환율을 찾는다.
    /// 2. (아웃풋 가격 / 인풋 기본 가격) = 배 수 X 아웃풋 나라 환율
    final inputRate = _rate.conversionRates
        .firstWhere((element) => element.country == inputDropdownValue);

    final outputRate = _rate.conversionRates
        .firstWhere((element) => element.country == outputDropdownValue);

    _inputPrice =
        (num.tryParse(_outputController.text) ?? 0) / outputRate.rate * inputRate.rate;
    _inputController.text = _inputPrice.toString();

    notifyListeners();
  }
}
