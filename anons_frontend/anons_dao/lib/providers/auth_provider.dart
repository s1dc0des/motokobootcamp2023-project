import 'package:agent_dart/principal/principal.dart';
import 'package:anons_dao/services/plug_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider with ChangeNotifier {
  final _plugService = PlugService();
  bool loggedIn = false;
  Principal myPrincipal = Principal.anonymous();

  login<bool>() async {
    bool connected = await _plugService.isConnected() as bool;
    if (connected == true) {
      loggedIn = true;
      myPrincipal = _plugService.getPrincipal();
    } else {
      loggedIn = false;
      myPrincipal = Principal.anonymous();
    }
    notifyListeners();
    return connected;
  }
}
