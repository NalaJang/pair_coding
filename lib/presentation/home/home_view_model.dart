import 'package:flutter/cupertino.dart';
import 'package:pair_coding/data/repository/subway_arrival_repository.dart';

import '../../data/model/subway_model.dart';

class HomeViewModel with ChangeNotifier {

  List<SubwayModel> subways =[];
  final SubwayArrivalRepository subwayRepository;

  HomeViewModel({
    required this.subwayRepository,
  });

  void getSubwayArrivalData() async {
    subways = await subwayRepository.getArrivals();
  }
}