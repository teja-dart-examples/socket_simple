import 'package:socket_prog_example/client/client.dart';

main() async {
  final lClient = new Client();

  await lClient.open();
}