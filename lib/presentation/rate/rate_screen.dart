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
    String? dropdownValue = viewModel.rate.conversionRates.first.country;

    return Scaffold(
      appBar: AppBar(
        title: const Text('환율'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              //TODO.토글
              Flexible(
                // flex: 1,
                child: TextFormField(
                  initialValue: '달러',
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
                value: dropdownValue,
                // items: viewModel.rate.conversionRates.map((e) => e.country).toList(),
                items: viewModel.rate.conversionRates.map<DropdownMenuItem<ConversionRate>>((ConversionRate value) {
                  return DropdownMenuItem<ConversionRate> (
                    value: value,
                    child: Text(value.country),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
            ],
          ),
          Flexible(
            // flex: 1,
            child: TextFormField(
              initialValue: '',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '국가 선택',
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),

          Text(viewModel.rate.timeLastUpdateUtc),
          // Expanded(
          //   child: ListView(
          //     children: viewModel.rate.conversionRates
          //         .map((e) => Text('${e.country} : ${e.rate}'))
          //         .toList(),
          //   ),
          // )
        ],
      ),
    );
  }
}
