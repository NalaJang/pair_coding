import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/repository/subway_arrival_repository.dart';

import '../../data/model/subway_model.dart';

class SubwayViewModel with ChangeNotifier {
  List<SubwayModel> subways = [];
  final SubwayArrivalRepository subwayRepository;

  SubwayViewModel({
    required this.subwayRepository,
  });

  Future<void> getSubwayArrivalData() async {
    subways = await subwayRepository.getArrivals();
    print(subways[0].barvlDt);

    notifyListeners();
  }
}
