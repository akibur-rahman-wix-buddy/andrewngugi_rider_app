import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';
import 'api.dart';

final class PostLogOutRX extends RxResponseInt {
  final api = LogOutApi.instance;

  String message = "Something went wrong";

  PostLogOutRX({required super.empty, required super.dataFetcher});

  ValueStream get getLogoutData => dataFetcher.stream;

  Future<bool> logOut() async {
    try {
      Map responseData = await api.logOut();
      return handleSuccessWithReturn(responseData);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) {
    dataFetcher.sink.add(data);

    // message = data["message"];
    // if (data["success"] == false) throw Exception();
    return true;
  }

  @override
  handleErrorWithReturn(error) {
    String errorMessage = 'Something went wrong';
    log(error.toString());

    errorMessage = error.response?.data["message"] ?? "Something went wrong";
    return super.handleErrorWithReturn(errorMessage);
  }
}
