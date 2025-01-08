import 'dart:async';

abstract mixin class GTWeb3AptosDartRPCClient {
  const GTWeb3AptosDartRPCClient();

  Future<Map<String, dynamic>> post({
    required Uri uri,
    required dynamic body,
    Map<String, String> headers = const {'Content-Type': 'application/json'},
  });

  Future<Map<String, dynamic>> get({
    required Uri uri,
    Map<String, dynamic>? queryParameters,
    Map<String, String> headers = const {'Content-Type': 'application/json'},
  });

  static void init(GTWeb3AptosDartRPCClient client) {
    _instance = client;
  }

  static GTWeb3AptosDartRPCClient? _instance;

  static GTWeb3AptosDartRPCClient get instance {
    assert(_instance != null, 'GTWeb3SuiDartRPCClient is not initialized');
    return _instance!;
  }

  static bool isEnabled() {
    return GTWeb3AptosDartRPCClient._instance != null;
  }
}
