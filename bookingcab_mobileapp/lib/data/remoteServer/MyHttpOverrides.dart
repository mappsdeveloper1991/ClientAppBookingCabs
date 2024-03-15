import 'dart:io';

Future<void> setupHttpOverrides() async {
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      // Insert your SSL pinning logic here
      // Compare the certificate's fingerprint or public key with the one you expect.
      return true; // Return true if the certificate is valid, false otherwise.
    };
    return client;
  }
}
