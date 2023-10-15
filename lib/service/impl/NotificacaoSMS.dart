import 'package:myapp_oo/service/NotificacaoInterface.dart';

import '../../classes/pessoa_abstract.dart';

class NotificacaoSMS implements NotificacaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("Enviando SMS para: ${pessoa.getNome()}");
  }
}
