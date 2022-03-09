/// This file contains information related to all requests
/// it contains information such as the:
/// - [host]
/// - [apiCredential] if there's any
/// - the various [uris]
/// - [scheme i.e http or https] etc.
/// it can also be used (through the named constructor) to switch the API
/// environment by setting different base values.
/// It can then be instantiated with the current environment
/// i.e. [API api = API.development].
class API {
  static const String host = 'getseam-v1.herokuapp.com';
  static const String apiKey = '91b31072';
  static const String scheme = 'https';

  Uri dynamicUri(String path) => Uri(
        scheme: scheme,
        host: host,
        path: path,
      );

// TODO: Fill in the various endpoint paths
  Uri get signinUrl => Uri(
        scheme: scheme,
        host: host,
        path: '/1.0/auth/account/signin/user',
      );

  Uri get verifyPhone => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/phone/verification',
      );

  Uri get verifyOTP => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/otp/verification',
      );

  Uri get register => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/register',
      );

  Uri get login => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/login',
      );

  Uri get resetPassword => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/reset-password',
      );

  Uri get customer => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/my/customers',
      );

  Uri get latestStyles => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/styles/latest',
      );

  Uri get seam => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/my/seams',
      );

  Uri get customerSeam => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/my/customers/:customer/seams',
      );

  Uri get measurement => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/my/measurements',
      );

  Uri get debtors => Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/my/debtors',
      );
}
