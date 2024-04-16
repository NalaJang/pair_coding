import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pair_coding/data/model/conversion_rate.dart';
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
      body: viewModel.inputDropdownValue.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(viewModel.rate.timeLastUpdateUtc),
                  Row(
                    children: [
                      Flexible(
                        // flex: 1,
                        child: TextFormField(
                          controller: viewModel.inputController,
                          onEditingComplete: () => viewModel.calculateOutputRate(),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: '가격 입력',
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      DropdownButton(
                        value: viewModel.inputDropdownValue,
                        items: viewModel.rate.conversionRates
                            .map((e) => DropdownMenuItem<String>(
                                  value: e.country,
                                  child: Text(e.country),
                                ))
                            .toList(),
                        onChanged: (value) {
                          viewModel.changeCountry(value!, true);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: viewModel.outputController,
                          onEditingComplete: () => viewModel.calculateInputRate(),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: '가격 입력',
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      DropdownButton(
                        value: viewModel.outputDropdownValue,
                        items: viewModel.rate.conversionRates
                            .map((e) => DropdownMenuItem<String>(
                                  value: e.country,
                                  child: Text(e.country),
                                ))
                            .toList(),
                        onChanged: (value) {
                          viewModel.changeCountry(value!, false);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
