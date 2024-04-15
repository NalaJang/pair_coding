import 'package:pair_coding/data/model/subway_model.dart';

abstract interface class subwayArrivalRepository{
  Future<List<SubWayModel>> getArrivals();
}