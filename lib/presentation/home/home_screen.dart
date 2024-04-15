import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('출발'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Row(
                children: [
                  Text('현재 시간'),
                  Text('${DateTime.now().toLocal()}'),
                ],
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(
              //   '시간',
              // ),
              Text('도착지'),
              Text('열차 종류'),
              Text('열차 번호'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.subways.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: viewModel.subways
                      .map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // SizedBox(
                              //   width: 100,
                              //   child: Text(
                              //     e.barvlDt,
                              //     overflow: TextOverflow.ellipsis,
                              //     style: TextStyle(
                              //       color:
                              //           index == 0 ? Colors.red : Colors.black,
                              //     ),
                              //   ),
                              // ),
                              Text(
                                e.trainLineNm,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  e.btrainSttus,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '${e.btrainNo}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
