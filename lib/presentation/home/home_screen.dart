import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pair_coding/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => context.read<HomeViewModel>().getSubwayArrivalData());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final currentTime = DateFormat("hh시 mm분").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('출발'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Text('현재 시간'),
                      const SizedBox(width: 10),
                      Text(currentTime),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '위치',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '도착지',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '열차 종류',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text('열차 번호'),
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: viewModel.subways
                        .map((e) => SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // 위치
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      e.arrvalMessage,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: viewModel.subways[0] == e
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),

                                  // 도착지
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      e.trainLineNm,
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: viewModel.subways[0] == e
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),

                                  // 열차 종류
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      e.btrainSttus,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: viewModel.subways[0] == e
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),

                                  // 열차 번호
                                  Expanded(
                                    flex: 1,
                                    // width: 50,
                                    child: Text(
                                      '${e.btrainNo}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: viewModel.subways[0] == e
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
