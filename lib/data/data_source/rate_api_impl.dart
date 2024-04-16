import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pair_coding/data/data_source/rate_api.dart';
import 'package:pair_coding/data/dto/rate_dto.dart';
import 'package:http/http.dart' as http;

class RateApiImpl implements RateApi{
  @override
  Future<RateDto> getRateDto() async {
    final apiKey = dotenv.env['API_KEY'];
    final response = await http.get(Uri.parse(
        'https://v6.exchangerate-api.com/v6/$apiKey/latest/USD'));

    return RateDto.fromJson(jsonDecode(response.body));
  }

}