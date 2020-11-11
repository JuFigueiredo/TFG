/// Classe do usuario a ser cadastrado no banco
class UserModel {
  /// altura
  String height;

  /// bairro
  String district;

  /// CEP
  String postalCode;

  /// Celular
  String phoneNumber;

  /// Celular do Contato de Emergência
  String sosPhoneNumber;

  /// Cidade
  String city;

  /// Complemento
  String additionalAddress;

  /// Data de Nascimento
  String birthDate;

  /// Estado
  String state;

  /// Nome Completo
  String name;

  /// Nome completo do Contato de Emergência
  String sosName;

  /// Número do endereço
  String number;

  /// Peso
  String weigth;

  /// Rua
  String street;

  /// Tipo Sanguíneo
  String bloodType;

  /// Construtor
  UserModel(
    this.height,
    this.district,
    this.postalCode,
    this.phoneNumber,
    this.sosPhoneNumber,
    this.city,
    this.additionalAddress,
    this.birthDate,
    this.state,
    this.name,
    this.sosName,
    this.number,
    this.weigth,
    this.street,
    this.bloodType,
  );
}
