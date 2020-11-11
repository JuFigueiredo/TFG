import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';

class UserController {
  ScreenArguments user = ScreenArguments(
      '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

  ScreenArguments getUser() {
    return user;
  }

  void setUser(ScreenArguments arguments) {
    user.Altura = arguments.Altura;
    user.Message = arguments.Message;
    user.CEP = arguments.CEP;
    user.Celular = arguments.Celular;
    user.Celular_Emergencia = arguments.Celular_Emergencia;
    user.Cidade = arguments.Cidade;
    user.Complemento = arguments.Complemento;
    user.Data_de_nascimento = arguments.Data_de_nascimento;
    user.Estado = arguments.Estado;
    user.Nome = arguments.Nome;
    user.Nome_Emergencia = arguments.Nome_Emergencia;
    user.Numero = arguments.Numero;
    user.Peso = arguments.Peso;
    user.Rua = arguments.Rua;
    user.Tipo = arguments.Tipo;
  }
}
