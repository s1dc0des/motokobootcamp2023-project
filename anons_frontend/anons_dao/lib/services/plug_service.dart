@JS()
library jquery;

import 'package:agent_dart/principal/principal.dart';
import 'package:anons_dao/helpers/chain_utils.dart';
// import 'package:/helper/chain_utils.dart';
import 'package:http/http.dart' as http;
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS("isConnected")
external bool _isConnected();

@JS("getPrincipal")
external String _getPrincipal();

@JS("approve")
external String _approve(int amount);

@JS("play")
external String _play(List<int> assetIds);

@JS("balance")
external String _balance();

@JS("allowance")
external String _allowance();

class PlugService {
  Future<bool> isConnected() async {
    try {
      return await promiseToFuture(_isConnected());
    } catch (e) {
      print(e);
      return false;
    }
  }

  Principal getPrincipal() {
    var res = _getPrincipal();
    return Principal.fromText(res);
  }

  bool isLoggedIn() {
    try {
      getPrincipal();
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<String> approve(int amount) async {
    return await promiseToFuture(_approve(amount));
  }

  Future play(List<int> numbers) async {
    return await promiseToFuture(_play(numbers));
  }

  Future<dynamic> balance() async {
    return await promiseToFuture(_balance());
  }

  Future<dynamic> allowance() async {
    return await promiseToFuture(_allowance());
  }

  String getFormattedPrincipal() {
    try {
      Principal userPrincipal = getPrincipal();
      return ChainUtils.formatPrincipal(principal: userPrincipal.toString());
    } catch (e) {
      return "";
    }
  }
}
