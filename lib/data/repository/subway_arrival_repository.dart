import 'package:pair_coding/data/model/subway_model.dart';

abstract interface class SubwayArrivalRepository{
  Future<List<SubWayModel>> getArrivals();
}