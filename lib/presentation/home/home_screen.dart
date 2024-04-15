import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('현재 시간'),
                Text('시간'),
                Text('출발'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('시간'),
                Text('도착지'),
                Text('열차 종류'),
                Text('열차 번호'),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: viewModel.getSubwayArrivalData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: viewModel.subways.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: viewModel.subways
                            .map((e) => Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        e.barvlDt,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        e.trainLineNm,
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
