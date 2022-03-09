abstract class INetworkService {
  Future<dynamic> get(
    Uri uri, {
    Map<String, String> headers,
  });

  Future<dynamic> post(
    Uri uri, {
    required Map<String, String> body,
    Map<String, String> headers,
  });

  Future<dynamic> put(
    Uri uri, {
    required Map<String, String> body,
    Map<String, String>? headers,
  });

  Future<dynamic> delete(Uri uri);
}
