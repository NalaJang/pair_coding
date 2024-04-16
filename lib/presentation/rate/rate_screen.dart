import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pair_coding/presentation/rate/rate_view_model.dart';
import 'package:provider/provider.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => {context.read<RateViewModel>().getRate()});
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RateViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('환율'),
      ),
      body: Column(
        children: [
          Text(viewModel.rate.timeLastUpdateUtc),
          Expanded(
            child: ListView(
              children: viewModel.rate.conversionRates
                  .map((e) => Text('${e}'))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
