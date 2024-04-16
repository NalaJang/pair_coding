import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                      _textFormField(
                        viewModel.inputController,
                        viewModel.calculateOutputRate,
                      ),
                      _dropdownButton(
                        viewModel.inputDropdownValue,
                        viewModel,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _textFormField(
                        viewModel.outputController,
                        viewModel.calculateInputRate,
                      ),
                      _dropdownButton(
                        viewModel.outputDropdownValue,
                        viewModel,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _textFormField(TextEditingController controller, Function calculate) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        onChanged: (value) => calculate(),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: '0.0',
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _dropdownButton(String value, RateViewModel viewModel) {
    return DropdownButton(
      value: value,
      items: viewModel.rate.conversionRates
          .map((e) => DropdownMenuItem<String>(
                value: e.country,
                child: Text(e.country),
              ))
          .toList(),
      onChanged: (value) {
        viewModel.changeCountry(value!, false);
      },
    );
  }
}
