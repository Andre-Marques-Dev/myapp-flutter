import 'package:myapp_oo/service/NotificacaoInterface.dart';

import '../../classes/pessoa_abstract.dart';

class NotificacaoPushNotification implements NotificacaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("Enviando Push para: ${pessoa.getNome()}");
  }
}
