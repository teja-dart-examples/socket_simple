import 'dart:io';
import 'dart:async';

class Client {
  Socket _socket;
  Future open() async {
    _socket = await Socket.connect("localhost", 4567);
    //_socket.setOption(SocketOption.TCP_NODELAY, true);

    _socket.listen((List<int> aData) {
      print("Received data ... ");
      print(aData);
    });

    _socket.write("Hey!");
  }
}