import '../models/user_model.dart';

/// Classe controller para atualização dos dados do usuário
class UserController {
  /// Instância do usuário
  UserModel user =
      UserModel('', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

  /// Retorna informações do usuário
  UserModel getUser() {
    return user;
  }

  /// Atribuição dos dados do usuário
  void setUser(UserModel arguments) {
    user.height = arguments.height;
    user.district = arguments.district;
    user.postalCode = arguments.postalCode;
    user.phoneNumber = arguments.phoneNumber;
    user.sosPhoneNumber = arguments.sosPhoneNumber;
    user.city = arguments.city;
    user.additionalAddress = arguments.additionalAddress;
    user.birthDate = arguments.birthDate;
    user.state = arguments.state;
    user.name = arguments.name;
    user.sosName = arguments.sosName;
    user.number = arguments.number;
    user.weigth = arguments.weigth;
    user.street = arguments.street;
    user.bloodType = arguments.bloodType;
  }
}
