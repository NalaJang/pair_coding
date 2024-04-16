import 'package:flutter/material.dart';
import 'package:pair_coding/data/data_source/rate_api_impl.dart';
import 'package:pair_coding/data/repository/rate_repo_impl.dart';
import 'package:pair_coding/presentation/rate/rate_screen.dart';
import 'package:pair_coding/presentation/rate/rate_view_model.dart';
import 'package:pair_coding/presentation/subway/subway_screen.dart';
import 'package:pair_coding/presentation/subway/subway_view_model.dart';
import 'package:provider/provider.dart';

import '../data/data_source/subway_api_impl.dart';
import '../data/repository/subway_arrival_repo_impl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangeNotifierProvider(
                        create: (_) => SubwayViewModel(
                            subwayRepository: SubwayArrivalRepositoryImpl(
                                subwayApi: SubwayApiImpl())),
                        child: const SubwayScreen(),
                      );
                    },
                  ),
                );
              },
              child: const Text('지하철'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangeNotifierProvider(
                        create: (_) => RateViewModel(
                          repository: RateRepositoryImpl(rateApi: RateApiImpl()),
                        ),
                        child: const RateScreen(),
                      );
                    },
                  ),
                );
              },
              child: const Text('환율'),
            )
          ],
        ),
      ),
    );
  }
}
