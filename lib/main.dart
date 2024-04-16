import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pair_coding/data/data_source/subway_api_impl.dart';
import 'package:pair_coding/data/repository/subway_arrival_repo_impl.dart';
import 'package:pair_coding/presentation/subway/subway_screen.dart';
import 'package:pair_coding/presentation/subway/subway_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
      home: ChangeNotifierProvider(
        create: (_) => SubwayViewModel(subwayRepository: SubwayArrivalRepositoryImpl(subwayApi: SubwayApiImpl())),
        child: const SubwayScreen(),
      ),
    );
  }
}
