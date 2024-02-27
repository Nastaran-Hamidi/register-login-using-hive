import 'package:newproject/models/responsemodel.dart';
import 'package:newproject/helpers//requests.dart';

String baseUrl = 'http://restapi.adequateshop.com';

class Sign {
  NetService apiCall = NetService();

  Future<ResponseModel> register(data) =>
      apiCall.postReq('/api/authaccount/registration', data: data);
}

class Login {
  NetService apiCall = NetService();

  Future<ResponseModel> login(data) =>
      apiCall.postReq('/api/authaccount/login', data: data);
}


