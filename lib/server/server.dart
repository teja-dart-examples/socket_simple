import 'dart:io';
import 'dart:async';

class ClientMan {
  ClientMan(this._socket);
  final Socket _socket;

  Future close() async {
    //TODO handle null socket
    await _socket.close();
    //TODO cancel stream subscriptions
  }
}

class Server {
  ServerSocket _socket;

  List<ClientMan> _clients = <ClientMan>[];

  Future open() async {
    _socket = await ServerSocket
        .bind(InternetAddress.ANY_IP_V4, 4567);
    _socket.listen((Socket aSocket) async {
      _clients.add(new ClientMan(aSocket));

      //aSocket.setOption(SocketOption.TCP_NODELAY, true);

      aSocket.listen((List<int> aData) {
        print("Received data ... ");
        print(aData);
      });

      await aSocket.write("Holla!");
    });
  }

  Future close() async {
    while(_clients.isNotEmpty) {
      ClientMan bClient = _clients.removeLast();
      await bClient.close();
    }
    await _socket.close();
  }
}
