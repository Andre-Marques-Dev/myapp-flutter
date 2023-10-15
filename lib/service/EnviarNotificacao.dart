import 'package:myapp_oo/classes/pessoa_abstract.dart';
import 'package:myapp_oo/enum/tipo_notificacao.dart';
import 'package:myapp_oo/service/NotificacaoInterface.dart';
import 'package:myapp_oo/service/impl/NotificacaoEmail.dart';
import 'package:myapp_oo/service/impl/NotificacaoPushNotification.dart';
import 'package:myapp_oo/service/impl/NotificacaoSMS.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        notificacao = NotificacaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificacaoPushNotification();
        break;
      case TipoNotificacao.SMS:
        notificacao = NotificacaoSMS();
        break;
      default:
        break;
    }
    if (notificacao != null) {
      notificacao!.enviarNotificacao(pessoa);
    } else {
      print("Pessoa sem tipo de notificação");
    }
  }
}
