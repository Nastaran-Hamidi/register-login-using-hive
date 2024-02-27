import 'dart:async';
import 'package:dio/dio.dart';
import 'package:newproject/models/responsemodel.dart';
import 'package:newproject/controllers/Apis.dart';

class NetService {
  Dio dio = Dio();

  Future<Options> getOptions({needToken = true}) async {
    Options options = Options(
      receiveDataWhenStatusError: true,
      validateStatus: (_) => true,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
    };
    return options..headers = headers;
  }

  Future<ResponseModel> postReq(url, {data, needToken = false}) async {
    String link = baseUrl + url;
    Options options = await getOptions(needToken: needToken);
    Response res = await dio.post(link, options: options, data: data);
    return setResponseModel(res);
  }
}



