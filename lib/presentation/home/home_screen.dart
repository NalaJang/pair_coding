import 'package:flutter/material.dart';
import 'package:pair_coding/presentation/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('시간'),
              Text('도착지'),
              Text('열차 종류'),
              Text('열차 번호'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Row(children: [
                  // TODO. 뷰모델 데이터 연결
                  Text('시간'),
                  Text('도착지'),
                  Text('열차 종류'),
                  Text('열차 번호'),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
