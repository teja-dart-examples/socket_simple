import 'package:socket_prog_example/server/server.dart';

main() async {
  final lServ = new Server();

  await lServ.open();
}