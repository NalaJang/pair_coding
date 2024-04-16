import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pair_coding/data/data_source/rate_api_impl.dart';
import 'package:pair_coding/data/data_source/subway_api_impl.dart';
import 'package:pair_coding/data/repository/rate_repo_impl.dart';
import 'package:pair_coding/data/repository/subway_arrival_repo_impl.dart';
import 'package:pair_coding/presentation/rate/rate_screen.dart';
import 'package:pair_coding/presentation/rate/rate_view_model.dart';
import 'package:pair_coding/presentation/subway/subway_screen.dart';
import 'package:pair_coding/presentation/subway/subway_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Column(
            children: [
              FloatingActionButton(
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
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangeNotifierProvider(
                          create: (_) => RateViewModel(
                              repository: RateRepositoryImpl(
                                  rateApi: RateApiImpl()), ),
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
        ));
  }
}

// ChangeNotifierProvider(
// create: (_) => SubwayViewModel(subwayRepository: SubwayArrivalRepositoryImpl(subwayApi: SubwayApiImpl())),
// child: const SubwayScreen(),
// ),
